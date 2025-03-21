//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    
    @State var plataformas_de_la_serie: [Plataforma] = []
    
    @State var nombre_de_plataforma: String = ""
    @State var imagen_de_plataforma: String = ""
    @State var plataforma_seleccionada: [Plataforma] = []
    
    @State var fecha_de_estreno: Int = 0
    @State var sipnosis_de_la_serie: String = ""
    @State var temporadas_de_la_serie: String = ""
    @State var caratura_de_la_serie: String = ""
    
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Spacer()
        
        Text("Agrega la serie que desees")
            .font(
                .custom("DIN Condensed", size: 30)
                .weight(.heavy)
            )
        
        TextField("Nombre de la serie", text: $nombre_de_la_serie)
            .padding(10)
            .background(Color.textFieldFondo)
            .cornerRadius(20)
            .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        
        TextField("Tipo de la serie", text: $tipo_de_la_serie)
        
        Spacer()
        
        Text("Plataformas")
        
        ScrollView(.horizontal){
            HStack{
                ForEach(plataformas_de_la_serie){ plataforma in
                    VStack{
                        Image(systemName: plataforma.imagen)
                        Text(plataforma.nombre)
                    }
                }
            }.sheet(isPresented: $mostrar_agregar_plataformas){
                Spacer()
                
                Text("Por favor agrega una plataforma")
                
                TextField("Nombre de la plataforma", text: $nombre_de_plataforma)
                TextField("Indica la imagen", text: $imagen_de_plataforma)
                
                ScrollView(){
                    VStack{
                        ForEach(plataformas){plataforma in
                            Text(plataforma.nombre)
                        }
                    }
                }
                
                Button("Agregar plataforma"){
                    if !nombre_de_plataforma.isEmpty && !imagen_de_plataforma.isEmpty {
                        let plataforma_nueva = Plataforma(nombre: nombre_de_plataforma, imagen: imagen_de_plataforma)
                        
                        plataformas_de_la_serie.append(plataforma_nueva)
                        
                        nombre_de_plataforma = ""
                        imagen_de_plataforma = ""
                        
                        mostrar_agregar_plataformas.toggle()
                    }
                }
                
                Spacer()
                
            }.presentationDetents([.medium, .large])
        }
        
        Spacer()
        
        Button("Agregar plataforma"){
            mostrar_agregar_plataformas = true
        }
        

        TextField("Sipnosis de la serie", text: $sipnosis_de_la_serie)
        TextField("Caratula de la serie", text: $caratura_de_la_serie)
        
        Spacer()
        
        Button("Agregar serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas_de_la_serie, fecha_estreno: fecha_de_estreno, sinopsis: sipnosis_de_la_serie , caratula: caratura_de_la_serie)
            
            indicar_problemas =  !controlador.agregar_serie(serie: serie_nueva)
        }
        
        Spacer()
    }
}

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
