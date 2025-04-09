//
//  personaje_vista.swift
//  redes_sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PersonajeVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ScrollView{
            Text("\(controlador.personaje_seleccionado?.name ?? "Valor por defecto")")
                .font(.system(size: 50))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                
            
            AsyncImage(url: URL(string: "\(controlador.personaje_seleccionado?.image ?? "Valor por defecto")")){ image in
                image
                    .image?.resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 300)
            }
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
                
                VStack{

                    Text("Raza: \(controlador.personaje_seleccionado?.race ?? "Valor por defecto")")
                    Text("Género: \(controlador.personaje_seleccionado?.gender ?? "Valor por defecto")")
                    Text("Planeta de origen: \(controlador.personaje_seleccionado?.originPlanet?.name ?? "Valor por defecto")")
                    Text("Afiliación: \(controlador.personaje_seleccionado?.affiliation ?? "Valor por defecto")")
                    
                    Text("Ki: \(controlador.personaje_seleccionado?.ki ?? "0")")
                    Text("Ki máximo: \(controlador.personaje_seleccionado?.maxKi ?? "0")")
                    
                }.padding()
                
            }.padding()

            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
                
                Text("\(controlador.personaje_seleccionado?.description ?? "Aquí va la descripción de los personajes")")
                    .padding(30)
                    .multilineTextAlignment(.center)
                    
            }.padding()
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
                
                Text("\(controlador.personaje_seleccionado?.transformations?.count)")
                    .padding(30)
                    .multilineTextAlignment(.center)

                
                Divider()
                
                
            }.padding()
           
        }.background(Color.orange)
    }
}

#Preview {
    PersonajeVista()
        .environment(ControladorAplicacion())
}
