workspace {
    model {
        usuario = person "Usuario"
        
        #sistema principal (aplicación)
        wikiosko = softwareSystem "Wikiosko" {
            appMovil = container "Aplicación movil" "Provee accesos al usuario a todas las funcionalidades desde un dispositivo movil" "" "AppMobile"{
                usuario -> this "Accede a"
                
                
            }
            
            products = container "Products" "Bounded context relacionado a los productos que poseen las tiendas" "" "products"{
                appMovil -> this "Obtiene los productos por tienda"
                
            }
            
            stores = container "Stores" "Bounded context relacionado a las tiendas registrados en la aplicación" "" "stores"{
                appMovil -> this "Obtiene las tiendas registradas"
                backend = component "Backend del sistema"{
                appMovil -> this "Expone Funcionalidades"
                }
            searchstore = component "Busqueda de local"
            dataconnector = component "Conector de la Base de Datos"
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
                searchstore -> this "Acceso a la lista de opciones"
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
                dataconnector -> this "Lectura y escritura de base de data."
            }

            usuario -> this "Accede a"
        }

        #Google Maps
        googleMaps = softwareSystem "Google Maps" {
            wikiosko -> this "Devuelve la ubicación del usuario; y muestra el mapa cerca de la ubicación de este y de donde desee poder ver"
        }

        #Sistema de emails
        sistemaDeEmails = softwareSystem "Sistema de emails" {
            wikiosko -> this "Solicita el envío de mensajes via email"
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
        component stores {
            include *
            autolayout lr
        }

        theme default
    }
}
