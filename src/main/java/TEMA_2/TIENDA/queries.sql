-- Llista el nom de tots els productes que hi ha en la taula producto.
select nombre from producto;
-- Llista els noms i els preus de tots els productes de la taula producto.
select nombre , precio from producto;
-- Llista totes les columnes de la taula producto.
select * from producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
select nombre, precio, truncate(precio * 1.12, 2) from producto;
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
select nombre as "Nombre de Producto", precio as "Euros", truncate(precio *1.12, 2) as "Dolares" from producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
select upper(nombre) as NOMBRE, precio as PRECIO from producto;
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
select lower(nombre) as nombre, precio from producto;
-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
select nombre, upper(substring(nombre,1,2)) as "2 primeras letras" from fabricante;
-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
select nombre, round(precio, 0) as "Precio Redondeado" from producto;
-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
select nombre, truncate(precio, 0) as "Precio sin decimal" from producto;
-- Llista el codi dels fabricants que tenen productes en la taula producto.
select fabricante.codigo as codigo_fabricante from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante;
-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
select distinct fabricante.codigo as codigo_fabricante from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante;
-- Llista els noms dels fabricants ordenats de manera ascendent.
select nombre from producto order by nombre asc;
-- Llista els noms dels fabricants ordenats de manera descendent.
select nombre from producto order by nombre desc;
-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
select nombre, precio from producto order by nombre asc, precio desc;
-- Retorna una llista amb les 5 primeres files de la taula fabricante.
select * from fabricante limit 5;
-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select * from fabricante limit 3,2;
-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
select nombre, precio from producto order by precio asc limit 1;
-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
select nombre, precio from producto order by precio desc limit 1;
-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
select nombre from producto where codigo_fabricante = 2;
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.nombre asc;
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
select producto.nombre, producto.precio, fabricante.nombre as "Nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio asc limit 1;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
select producto.nombre, producto.precio, fabricante.nombre as "Nombre fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio desc limit 1;
-- Retorna una llista de tots els productes del fabricant Lenovo.
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Lenovo";
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Crucial" and producto.precio > 200;
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Asus" or  fabricante.nombre = "Hewlett-Packard" or fabricante.nombre = "Seagate";
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre in ("Asus","Hewlett-Packard","Seagate");
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
select producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like "%e";
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
select producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like "%w%";
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where producto.precio > 180 order by producto.precio desc, producto.nombre desc;
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
select distinct fabricante.codigo, fabricante.nombre from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante;
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
select fabricante.nombre as "Nombre Fabricante", producto.nombre as "Producto" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante;
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
select fabricante.nombre as "Nombre FAbricante", producto.nombre as "Producto" from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante where isnull(producto.nombre);
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
select producto.nombre, fabricante.nombre as "Fabricante" from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Lenovo";
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
select * from producto where precio = (select max(precio) from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Lenovo");
-- Llista el nom del producte més car del fabricant Lenovo.
select producto.nombre, producto.precio, fabricante.nombre as "Fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Lenovo" order by producto.precio desc limit 1;
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
select producto.nombre, producto.precio, fabricante.nombre as "Fabricante" from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Hewlett-Packard" order by producto.precio asc limit 1;
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
select producto.*, (select nombre from fabricante where fabricante.codigo = producto.codigo_fabricante) as "Fabricante" from producto where producto.precio >= any (select max(precio) from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = "Lenovo");
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
select *, (select nombre from fabricante where fabricante.codigo = producto.codigo_fabricante) as "Fabricante"  from producto where precio > (select avg(precio) from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'asus');