//Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants.
db.getCollection('restaurante').find();
//Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine per tots els documents en la col·lecció Restaurants.
db.getCollection('restaurante').find({}, {restaurant_id : 1, name : 1, borough : 1, cuisine : 1});
//Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però exclou el camp _id per tots els documents en la col·lecció Restaurants.
db.getCollection('restaurante').find({}, {_id : 0, restaurant_id : 1, name : 1, borough : 1, cuisine : 1});
//Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però exclou el camp _id per tots els documents en la col·lecció Restaurants.
db.getCollection('restaurante').find({}, {_id : 0, restaurant_id : 1, name : 1, 'borough' : 1, 'address.zipcode' : 1});
//Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.
db.getCollection('restaurante').find({borough : 'Bronx' });
//Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.
db.getCollection('restaurante').find({borough : 'Bronx' }).limit(5);
//Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx.
db.getCollection('restaurante').find({borough : 'Bronx' }).limit(5).skip(5);
//Escriu una consulta per trobar els restaurants que tenen un score de més de 90.
db.getCollection('restaurante').find({ 'grades.score': { $gt: 90 }});
//Escriu una consulta per trobar els restaurants que tenen un score de més de 80 però menys que 100.
db.getCollection('restaurante').find({ 'grades': { $elemMatch: { 'score': { $gt: 80, $lt: 100 } } } });
//Escriu una consulta per trobar els restaurants que es localitzen en valor de latitud menys de -95.754168.
db.getCollection('restaurante').find({'address.coord': {$lt: -95.754168}});
//Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i la seva qualificació és superior a 70 i longitud inferior a -65.754168.
db.getCollection('restaurante').find({$and: [{cuisine : {$not: /American/}}, {'grades.score' : { $gt : 70}}, {'address.coord' : { $lt: -65.754168}}]});
//Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van aconseguir un marcador més de 70 i localitzat en la longitud menys que -65.754168. Nota: Fes aquesta consulta sense utilitzar $and operador.
db.getCollection('restaurante').find({{cuisine : {$not: /American/}}, {'grades.score' : { $gt : 70}}, {'address.coord' : { $lt: -65.754168}}});
//Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van obtenir un punt de grau 'A' no pertany a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent.
db.getCollection('restaurante').find({$and:[{cuisine:{$ne:'American'}},{'grades.grade':'A'},{borough:{$ne:'Bronx'}}]}).sort({'cuisine': -1});
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' com les tres primeres lletres en el seu nom.
db.getCollection('restaurante').find({ name: /^Wil/ }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'ces' com les últimes tres lletres en el seu nom.
db.getCollection('restaurante').find({ name : /ces$/ } , { restaurant_id : 1, name : 1, borough : 1, cuisine : 1 });
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' com tres lletres en algun lloc en el seu nom.
db.getCollection('restaurante').find({ name : /Reg/} , { restaurant_id : 1, name : 1, borough : 1, cuisine : 1 });
//Escriu una consulta per trobar els restaurants que pertanyen al Bronx i van preparar qualsevol plat americà o xinès.
db.getCollection('restaurante').find({$and: [{ $or : [{cuisine : 'American'}, {cuisine : 'Chinese'}]}, {borough : 'Bronx'}]});
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que pertanyen a Staten Island o Queens o Bronx o Brooklyn.
db.getCollection('restaurante').find({borough : {$in : ['Staten Island', 'Queens' , 'Bronx' , 'Brooklyn']}}, {_id : 0 ,  restaurant_id : 1, name : 1, borough : 1 , cuisine : 1 });
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que no pertanyen a Staten Island o Queens o Bronx o Brooklyn.
db.getCollection('restaurante').find({borough : {$nin : ['Staten Island', 'Queens' , 'Bronx' , 'Brooklyn']}},{_id : 0 ,  restaurant_id : 1, name : 1, borough : 1 , cuisine : 1 });
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que aconsegueixin un marcador que no és més de 10.
db.getCollection('restaurante').find({'grades.score' : { $not: {$gt: 10}}}, { restaurant_id : 1, name : 1, borough : 1 , cuisine : 1 });
//Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que preparen peix excepte 'American' i 'Chinees' o el name del restaurant comença amb lletres 'Wil'.
db.getCollection('restaurante').find({ $or: [{ $and: [{ cuisine: 'Seafood' }, { cuisine: { $nin: ['American', 'Chinese'] } }] }, { name: /^Wil/ }] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });
//Escriu una consulta per trobar el restaurant_id, name, i grades per a aquells restaurants que aconsegueixin un grau "A" i un score 11 en dades d'estudi ISODate "2014-08-11T00:00:00Z".
db.getCollection('restaurante').find({ grades : { $elemMatch : { date : ISODate("2014-08-11T00:00:00Z"), score : 11, grade : 'A' }}}, { restaurant_id: 1, name: 1, grades:1});
//Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants on el 2n element de varietat de graus conté un grau de "A" i marcador 9 sobre un ISODate "2014-08-11T00:00:00Z".
db.getCollection('restaurante').find({ 'grades.grade': "A", 'grades.score': 9, 'grades.date': ISODate("2014-08-11T00:00:00Z") }, { restaurant_id: 1, name: 1, grades: { $slice: [1, 1] } });
//Escriu una consulta per trobar el restaurant_id, name, adreça i ubicació geogràfica per a aquells restaurants on el segon element del array coord conté un valor que és més de 42 i fins a 52.
db.getCollection('restaurante').find({'address.coord' :  {$gt : 42, $lte : 52}},  { restaurant_id: 1, name: 1, 'address.street' : 1 , 'address.coord': { $slice: [1, 1] } });
//Escriu una consulta per organitzar el nom dels restaurants en ordre ascendent juntament amb totes les columnes.
db.getCollection('restaurante').find({}).sort( {name : 1});
//Escriu una consulta per organitzar el nom dels restaurants en ordre descendent juntament amb totes les columnes.
db.getCollection('restaurante').find({}).sort( {name : -1});
//Escriu una consulta per organitzar el nom de la cuisine en ordre ascendent i pel mateix barri de cuisine. Ordre descendent.
db.getCollection('restaurante').find({}).sort( {cuisine : 1, borough : -1});
//Escriu una consulta per saber totes les direccions que no contenen el carrer.
db.getCollection('restaurante').find({ 'address.street': null });
//Escriu una consulta que seleccionarà tots els documents en la col·lecció de restaurants on el valor del camp coord és Double.
db.getCollection('restaurante').find( { 'address.coord' : { $type : 'double'}});
//Escriu una consulta que seleccionarà el restaurant_id, name i grade per a aquells restaurants que retornin 0 com a resta després de dividir el marcador per 7.
db.getCollection('restaurante').find({ 'grades.score' : { $mod: [7, 0] } }, { restaurant_id: 1, name: 1, grades: 1, _id: 0 });
//Escriu una consulta per trobar el name de restaurant, borough, longitud i altitud i cuisine per a aquells restaurants que contenen 'mon' com tres lletres en algun lloc del seu nom.
db.getCollection('restaurante').find({ name: /mon/ },{ name: 1, borough: 1, "address.coord": 1, cuisine: 1, _id: 0 });
//Escriu una consulta per trobar el name de restaurant, borough, longitud i latitud i cuisine per a aquells restaurants que contenen 'Mad' com primeres tres lletres del seu nom.
db.getCollection('restaurante').find({ name : /^Mad/ }, { name : 1, borough : 1, 'address.coord' : 1, cuisine : 1, _id : 0} );