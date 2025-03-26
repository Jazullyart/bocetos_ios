//
//  publicaciones_general.swift
//  redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
//    @StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    Text("\(publicacion.id)")
                    VStack{
                        Text("\(publicacion.title)")
                        Text("\(publicacion.body)")
                        }
                    }
                }
            }
        }
    }

#Preview {
    GeneralPublicaciones()
}
