//
//  File.swift
//  redes_sociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        TabView{
            GeneralPublicaciones()
                .tabItem { Label("Es esta una pantalla", systemImage: "message") }
                .badge(controlador.publicaciones.count)
            
            Text("Holi mundo dos")
                .tabItem {
                    Label{
                        Text("Hola mundo desde abajo")
                        Text("Esto es un segundo clic")
                    } icon: {
                        Circle()
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("JJ Abarhams"))
                    }
                }
            
            Text("Hola desde pantalla 3")
                .tabItem { Label("Etiqueta de esta label", systemImage: "phone") }
            
//            Text("Etiqueta", systemImage: "phone") {
//                Text("A")
//            }
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
