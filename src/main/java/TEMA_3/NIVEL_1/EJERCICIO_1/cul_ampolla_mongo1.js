db.createCollection('Cliente', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Cliente',
      required: ['nombre', 'informacion', 'ultima_compra'],
      properties: {
        nombre: {
          bsonType: 'string'
        },
        informacion: {
          bsonType: 'object',
          title: 'object',
          properties: {
            calle: {
              bsonType: 'string'
            },
            numero: {
              bsonType: 'int'
            },
            telefono: {
              bsonType: 'string'
            },
            email: {
              bsonType: 'string'
            },
            codigo_postal: {
              bsonType: 'string'
            }
          }
        },
        fecha_registro: {
          bsonType: 'date'
        },
        ultima_compra: {
          bsonType: 'object',
          title: 'object',
          properties: {
            gafa: {
              bsonType: 'object',
              title: 'object',
              properties: {
                graduacion: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    ojo_derecho: {
                      bsonType: 'decimal'
                    },
                    ojo_izquierdo: {
                      bsonType: 'decimal'
                    }
                  }
                },
                color_cristal: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    cristal_derecho: {
                      bsonType: 'string'
                    },
                    cristal_izquierdo: {
                      bsonType: 'string'
                    }
                  }
                },
                montura: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    pasta: {
                      bsonType: 'string'
                    },
                    metalica: {
                      bsonType: 'string'
                    },
                    flotante: {
                      bsonType: 'string'
                    }
                  }
                },
                precio: {
                  bsonType: 'decimal'
                }
              }
            },
            vendedor: {
              bsonType: 'string'
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
