db.createCollection('Tienda', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Tienda',
      required: ['_idtienda'],
      properties: {
        _idtienda: {
          bsonType: 'objectId'
        },
        nombre: {
          bsonType: 'string'
        },
        pedido: {
          bsonType: 'object',
          title: 'object',
          properties: {
            id_pedido: {
              bsonType: 'int'
            },
            productos: {
              bsonType: 'object',
              title: 'object',
              properties: {
                producto: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    pizza: {
                      bsonType: 'object',
                      title: 'object',
                      properties: {
                        categoria: {
                          bsonType: 'string'
                        }
                      }
                    },
                    hamburguesa: {
                      bsonType: 'string'
                    },
                    bebida: {
                      bsonType: 'string'
                    }
                  }
                },
                cantidad: {
                  bsonType: 'int'
                },
                informacion: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    nombre: {
                      bsonType: 'string'
                    },
                    descripccion: {
                      bsonType: 'string'
                    },
                    imagen: {
                      bsonType: 'string'
                    }
                  }
                },
                precio_total: {
                  bsonType: 'decimal'
                }
              }
            },
            total: {
              bsonType: 'decimal'
            },
            cliente: {
              bsonType: 'object',
              title: 'object',
              properties: {
                nombre: {
                  bsonType: 'string'
                },
                apellido: {
                  bsonType: 'string'
                },
                tipo_reparto: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    recogida_en tienda: {
                      bsonType: 'string'
                    },
                    reparto_domicilio: {
                      bsonType: 'object',
                      title: 'object',
                      properties: {
                        calle: {
                          bsonType: 'string'
                        },
                        piso: {
                          bsonType: 'string'
                        },
                        puerta: {
                          bsonType: 'string'
                        },
                        localidad: {
                          bsonType: 'string'
                        },
                        provincia: {
                          bsonType: 'string'
                        },
                        telefono: {
                          bsonType: 'string'
                        }
                      }
                    }
                  }
                }
              }
            },
            hora_pedido: {
              bsonType: 'timestamp'
            }
          }
        },
        direccion: {
          bsonType: 'object',
          title: 'object',
          properties: {
            direccion: {
              bsonType: 'string'
            },
            codigo_postal: {
              bsonType: 'string'
            },
            localidad: {
              bsonType: 'string'
            },
            provincia: {
              bsonType: 'string'
            }
          }
        },
        trabajadores: {
          bsonType: 'object',
          title: 'object',
          properties: {
            cocinero: {
              bsonType: 'string'
            },
            repartidor: {
              bsonType: 'string'
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
