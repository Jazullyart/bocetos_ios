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
    @State var plataformas_de_la_serie: [Plataforma] = [
        Plataforma(nombre: "Hulu", icono: "play.tv"),
        Plataforma(nombre: "HBO", icono: "play.tv"),
        Plataforma(nombre: "Prime Video", icono: "play.tv"),
        Plataforma(nombre: "Vix", icono: "play.tv"),
        Plataforma(nombre: "Netflix", icono: "play.tv"),
        Plataforma(nombre: "Disney Plus", icono: "play.tv")
    ]
    @State var fecha_de_estreno: Int = 0
    @State var sipnosis_de_la_serie: String = ""
    @State var temporadas_de_la_serie: String = ""
    @State var caratura_de_la_serie: String = ""
    
    @State var indicar_problemas: Bool = false
    
    var body: some View {
        Text("Agrega la serie que desees")
        TextField("Nombre de la serie", text: $nombre_de_la_serie)
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        TextField("Tipo de la serie", text: $tipo_de_la_serie)
        
        ScrollView{
            Text("Plataformas")
            HStack{
                ForEach(plataformas_de_la_serie){ plataforma in
                    VStack{
                        Image(systemName: plataforma.icono)
                        Text(plataforma.nombre)
                    }
                }
            }
        }

        
        Button("Agregar plataforma"){
            print("Agregar una plataforma")
        }
        

        TextField("Sipnosis de la serie", text: $sipnosis_de_la_serie)
        TextField("Caratula de la serie", text: $caratura_de_la_serie)
        
        Button("Agregar serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas_de_la_serie, fecha_estreno: fecha_de_estreno, sinopsis: sipnosis_de_la_serie , caratula: caratura_de_la_serie)
            
            indicar_problemas =  !controlador.agregar_serie(serie: serie_nueva)
        }
    }
}

/*
 var nombre: String
 var tipo: String
 
 var plataformas: [Plataforma] = []
 
 var fecha_estreno: Int
 var sinopsis: String
 
 var temporadas: [Temporada] = []
 
 var caratula: String
 
 */

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
