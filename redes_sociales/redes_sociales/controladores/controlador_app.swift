//
//  controlador_app.swift
//  redes_sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion {
    var publicaciones: Array<Publicacion> = []
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    
    func descargar_publicaciones() async {
        defer {
            print("Esta funcion se mandó a llamar después de todos los await en mi función \(#function)")
        }
        
        guard let publicaciones_dercargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_dercargadas
    }
}
