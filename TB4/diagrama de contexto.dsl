workspace {
    model {
        usuario = person "Usuario"
        
        #sistema principal (aplicación)
        wikiosko = softwareSystem "Wikiosko" {
            usuario -> this "Accede a"
        }

        #acá se almacenan las ubicaciones de las tiendas, stock, valoraciones, bloqueos y comentarios hechos hacia esta
        Tiendas = softwareSystem "Sistema de información de tiendas" {
            wikiosko -> this "Devuelve la información de las tiendas segun las necesidades del usuario"
        }

        #Google Maps
        googleMaps = softwareSystem "Google Maps" {
            wikiosko -> this "Devuelve la ubicación del usuario; y muestra el mapa cerca de la ubicación de este y de donde desee poder ver"
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