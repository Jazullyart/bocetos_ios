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
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink {
                            Text("Holi Mundo")
                        } label: {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            } 
//                            .onTapGesture {
//                                print("Usted a seleccionado: \(publicacion.id)")
//                            }
                        }
                    
                    }
                }.padding()
                
            }
        }
    }
}

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
