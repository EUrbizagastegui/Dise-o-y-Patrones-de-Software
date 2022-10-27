workspace {
    model {
        usuario = person "Usuario"
        
        #sistema principal (aplicación)
        wikiosko = softwareSystem "Wikiosko" {
            usuario -> this "Accede a"
        }

        #acá se almacenan las ubicaciones de las tiendas, stock, valoraciones, bloqueos y comentarios hechos hacia esta
        registroDeTiendas = softwareSystem "Sistema de registro de tiendas" {
            wikiosko -> this "Devuelve las tiendas segun las necesidades del usuario"
        }

        #acá se almacenan las tiendas que ha visitado el usuario dentro de la aplicación
        registroDeVisitas = softwareSystem "Sistema de registro de visitas" {
            wikiosko -> this "Devuelve el historial de visitas a perfiles de tiendas del usuario"
        }
        
        #se guarda el registro de todos los comentarios hechos por el usuario
        historialDeComentarios = softwareSystem "Historial de comentarios del usuario" {
            wikiosko -> this "Agrega, modifica o elimina los comentarios del usuario"
        }

        #se accede a la ubicación del usuario
        ubicacionDelUsuario = softwareSystem "Identificador de la ubicación del usuario" {
            wikiosko -> this "Devuelve la ubicación actual del usuario"
        }

        #se muestra el mapa
        sistemaDeMapas = softwareSystem "Sistema de visualización de mapa" {
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
    }
}