db.createCollection('Gafa', {
validator: {
$jsonSchema: {
bsonType: 'object',
title: 'Gafa',
properties: {
marca: {
bsonType: 'string'
},
montura: {
bsonType: 'object',
title: 'object',
properties: {
pasta: {
bsonType: 'string'
},
flotante: {
bsonType: 'string'
},
metalica: {
bsonType: 'string'
}
}
},
proveedor: {
bsonType: 'object',
title: 'object',
properties: {
nombre: {
bsonType: 'string'
},
telefono: {
bsonType: 'string'
},
NIF: {
bsonType: 'string'
},
direccion: {
bsonType: 'object',
title: 'object',
properties: {
calle: {
bsonType: 'string'
},
numero: {
bsonType: 'string'
},
piso: {
bsonType: 'string'
},
puerta: {
bsonType: 'string'
},
codigo_postal: {
bsonType: 'string'
},
pais: {
bsonType: 'string'
}
}
}
}
},
precio: {
bsonType: 'decimal'
},
comprada_por: {
bsonType: 'object',
title: 'object',
properties: {
nombre: {
bsonType: 'string'
},
informacion_cliente: {
bsonType: 'object',
title: 'object',
properties: {
calle: {
bsonType: 'string'
},
numero: {
bsonType: 'string'
},
telefono: {
bsonType: 'string'
},
email: {
bsonType: 'string'
},
fecha_registro: {
bsonType: 'date'
}
}
},
fecha_compra: {
bsonType: 'date'
}
}
}
}
}
}
});
Object list
Main Diagram
Properties
