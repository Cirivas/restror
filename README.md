# REST RoR
## Flujo 

La aplicación comienza en `/users`, donde se pueden agregar usuarios (email, imagen), editar usuario (solo imagen) o eliminar usuarios. En `/login_form` es posible ingresar un email y una imagen. En el mismo formulario se entregará información sobre si el usuario fue autorizado o no. Igualmente, se enviará un email con la información del User Agent y el estado de la autorización (correcto o incorrecto).

Ocasionalmente, luego de varios intentos el sistema puede entregar el estado no autorizado. Esta simulación se realiza generando un número aleatorio entre 0 y 100. Si el número es <= 10 entonces se simula el error y se entrega el estado 401. 

## Testings 

* User Model

Verifica que las validaciones sean correctas

`rails test test/models/user_test.rb` 

Valor esperado: 1 assertion

* User Image format

Verifica que el modelo usuario sea válido ante un correo y un string. 

`rails test test/models/user_image_uploader_test.rb`

Valor esperado: 1 assertion

* User Controller 

Verifica los métodos del controlador del usuario

`rails test test/controllers/users_controller_test.rb`

Valor esperado: 8 runs, 5 assertions, 3 errors.

En este caso, los métodos update, create y login fallan con error, debido a que entre sus parámetros debe ir un objecto `ActionDispatch`, sin embargo, rails en sus test transforma los objetos a string, no pudiendo entonces acceder a los métodos del objeto. Más información [aquí](https://github.com/rails/rails/issues/26075)

* Webservices 

Verifica el correcto funcionamiento de ambos webservices

`rails test test/controllers/rest/*`

Valores esperados: 2 runs, 2 assertions. 

En ocasiones, dado el requerimiento de simular 10% de error, un test puede fallar. 


