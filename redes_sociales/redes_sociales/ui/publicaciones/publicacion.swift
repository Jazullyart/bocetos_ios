//
//  File.swift
//  redes_sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem Ipsum", body: "Et dolor si asem")

struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("\(controlador.publicacion_seleccionada?.title)")
        Text("\(controlador.publicacion_seleccionada?.body)")
        
        NavigationLink{
            Text("Hola mundo")
        } label: {
            Text("Ver perfil")
        }
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name)")
                    Text("\(comentario.body)")
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
