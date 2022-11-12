workspace {
    model {
        usuario = person "Usuario"
        
        #sistema principal (aplicación)
        wikiosko = softwareSystem "Wikiosko" {
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

        theme default
    }
}