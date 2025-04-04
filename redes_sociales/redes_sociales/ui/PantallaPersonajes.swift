//
//  PantallaPersonajes.swift
//  redes_sociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){ personaje in
                        HStack{
                            AsyncImage(url: URL(string: "\(personaje.image)")) { image in
                                image
                                    .image?.resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                            } .shadow(color: Color.yellow, radius: 0, x: 5, y:5)
                            VStack{
                                Text("\(personaje.name)")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    
                                
                                Text("\(personaje.race)")
                                
                                Text("\(personaje.affiliation)")
                            } .background(Color.white)
                        }
                        Divider()
                            .frame(height: 3)
                            .background(LinearGradient(colors: [Color.clear, Color.yellow, Color.clear], startPoint: .leading, endPoint: .trailing))
                    }
                }
            } .background(Color.orange)
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
