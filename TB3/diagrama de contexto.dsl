workspace {
    model {
        usuario = person "Usuario" "Persona que interactua con la aplicación"
        
        #sistema principal (aplicación)
        wikiosko = softwareSystem "Wikiosko" "Aplicacion que ayuda en la busqueda e identificacion de tiendas como kioskos, bodegas o minimarkets"{
            appMovil = container "Aplicación movil" "Provee accesos al usuario a todas las funcionalidades desde un dispositivo movil" "" "AppMobile"{
                usuario -> this "Accede a"
            }
            
            products = container "Products" "Bounded context relacionado a los productos que poseen las tiendas" "" "products"{
                appMovil -> this "Obtiene los productos por tienda"
                
            }
            
            stores = container "Stores" "Bounded context relacionado a las tiendas registrados en la aplicación" "" "stores"{
                appMovil -> this "Obtiene las tiendas registradas"
            }
            
            security = container "Security" "Bounded context relacionado a la creacion, autenticacion y actualización de cuentas" "" "security"{
                appMovil -> this "Valida o registra las cuentas ingresadas"
            }
            
            social = container "Social" "Bounded context relacionado a las promociones y las tiendas favoritas" "" "social"{
                appMovil -> this "Obtiene las promociones o tiendas guardadas como favoritas"
                stores -> this "Guarda una tienda como favoritas"
            }
            
            history = container "History" "Bounded context relacionado al historial de tiendas visitadas" "" "history" {
                appMovil -> this "Visualiza el historial de las tiendas visitadas"
                stores -> this "Registra tiendas como visitadas"
            }
            
            notification = container "Notification" "Bounded context relacionado a la emision de notificaciones" "" "notification" {
                appMovil -> this "Visualiza las notificationes existentes"
                products -> this "Solicita notificar la reserva de un producto"
                stores -> this "Solicita notificar el bloque de una tienda"
                social -> this "Solicita notificar las promociones existentes"
            }
            
            baseDeDatos = container "Base de datos" "Almacena datos relacionados a la lógica del negocio" "" "Database"{
                products -> this "Almacenan las reservas realizadas"
                security -> this "Valida la existencia de la cuenta o la registra"
                social -> this "Almacen tiendas favoritas"
            }

            usuario -> this "Accede a"
        }

        #acá se almacenan las ubicaciones de las tiendas, stock, valoraciones, bloqueos y comentarios hechos hacia esta
        registroDeTiendas = softwareSystem "Sistema de registro de tiendas" "Se almacenan las ubicaciones de las tiendas, stock, valoraciones, bloqueos y comentarios hechos hacia esta" {
            wikiosko -> this "Devuelve las tiendas segun las necesidades del usuario"
            
            
        }

        #acá se almacenan las tiendas que ha visitado el usuario dentro de la aplicación
        registroDeVisitas = softwareSystem "Sistema de registro de visitas" "Se almacenan las tiendas que ha visitado el usuario dentro de la aplicación"{
            wikiosko -> this "Devuelve el historial de visitas a perfiles de tiendas del usuario"
            
        }
        
        #se guarda el registro de todos los comentarios hechos por el usuario
        historialDeComentarios = softwareSystem "Historial de comentarios del usuario" "Se guarda el registro de todos los comentarios hechos por el usuario"{
            wikiosko -> this "Agrega, modifica o elimina los comentarios del usuario"
        }

        #se accede a la ubicación del usuario
        ubicacionDelUsuario = softwareSystem "Identificador de la ubicación del usuario" "Se accede a la ubicación del usuario"{
            wikiosko -> this "Devuelve la ubicación actual del usuario"
            
        }

        #se muestra el mapa
        sistemaDeMapas = softwareSystem "Sistema de visualización de mapa" "Se encarga de mostrar el mapa segun la ubicacion actual del usuario y demás referencias"{
            wikiosko -> this "Muestra el mapa cerca de donde esté el usuario y de donde este desee poder ver"
        }
    }

    views {
        systemContext wikiosko {
            include *
            autolayout lr
        }

        container wikiosko {
            include *
            autolayout lr
        }

        theme default
        
        styles {
            element "AppWeb" {
                shape WebBrowser
            }
            element "AppMobile"{
                shape MobileDevicePortrait
            }
            element "Database"{
                shape Cylinder
            }
        }
        
    }
}
