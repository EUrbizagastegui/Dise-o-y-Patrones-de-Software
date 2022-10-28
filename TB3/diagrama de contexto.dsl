    model {
        usuario = person "Usuario" "Persona que interactua con la aplicación"
        
        #sistema principal (aplicación)
        wikiosko = softwareSystem "Wikiosko" "Aplicacion que ayuda en la busqueda e identificacion de tiendas como kioskos, bodegas o minimarkets"{
            appMovil = container "Aplicación movil" "Provee accesos al usuario a todas las funcionalidades desde un dispositivo movil" "" "AppMobile"{
                usuario -> this "Accede a"
            }

            appWeb = container "Aplicación web" "Provee acceso al usuario a todas las funcionalidades desde un navegador web" "" "AppWeb"{
                usuario -> this "Accede a"
            }
            
            logicaDeNegocio = container "Lógica de negocio" "Provee informacion y datos acerca de la lógica de negocio"{
                appMovil -> this "Expone funcionalidades"
                appWeb -> this "Expone funcionalidades"
            }

            baseDeDatos = container "Base de datos" "Almacena datos relacionados a la lógica del negocio" "" "Database"{
                logicaDeNegocio -> this "Lee y escribe aqui"
            }

            usuario -> this "Accede a"
        }

        #acá se almacenan las ubicaciones de las tiendas, stock, valoraciones, bloqueos y comentarios hechos hacia esta
        registroDeTiendas = softwareSystem "Sistema de registro de tiendas" "Se almacenan las ubicaciones de las tiendas, stock, valoraciones, bloqueos y comentarios hechos hacia esta" {
            wikiosko -> this "Devuelve las tiendas segun las necesidades del usuario"
            logicaDeNegocio -> this "Obtiene la informacion de las tiendas"
            
        }

        #acá se almacenan las tiendas que ha visitado el usuario dentro de la aplicación
        registroDeVisitas = softwareSystem "Sistema de registro de visitas" "Se almacenan las tiendas que ha visitado el usuario dentro de la aplicación"{
            wikiosko -> this "Devuelve el historial de visitas a perfiles de tiendas del usuario"
            logicaDeNegocio -> this "Obtiene el historial de las visitasa perfiles de tiendas"
        }
        
        #se guarda el registro de todos los comentarios hechos por el usuario
        historialDeComentarios = softwareSystem "Historial de comentarios del usuario" "Se guarda el registro de todos los comentarios hechos por el usuario"{
            wikiosko -> this "Agrega, modifica o elimina los comentarios del usuario"
            logicaDeNegocio -> this "Agrega, modifica o elimina los comentarios del usuario"
        }

        #se accede a la ubicación del usuario
        ubicacionDelUsuario = softwareSystem "Identificador de la ubicación del usuario" "Se accede a la ubicación del usuario"{
            wikiosko -> this "Devuelve la ubicación actual del usuario"
            logicaDeNegocio -> this "Obtiene la ubicacion actual del usuario"
            
        }

        #se muestra el mapa
        sistemaDeMapas = softwareSystem "Sistema de visualización de mapa" "Se encarga de mostrar el mapa segun la ubicacion actual del usuario y demás referencias"{
            wikiosko -> this "Muestra el mapa cerca de donde esté el usuario y de donde este desee poder ver"
            logicaDeNegocio -> this "Obtiene el mapa y referencias a la ubicacion actual del usuario"
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