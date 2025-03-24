//
//  controlador_publicaciones.swift
//  redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class ControladorPublicaciones: ObservableObject{
    @Published var publicaciones: [Publicacion] = []
    
    let url_de_publicacion = "https://jsonplaceholder.typicode.com/posts"
    
    func obtener_publicaciones() async {
        guard let publicaciones_dercargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones(desde: url_de_publicacion) else { return }
                publicaciones = publicaciones_dercargadas
    }
    
}
