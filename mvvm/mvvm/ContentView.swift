//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    var body: some View {
        VStack {
            ForEach(controlador.series_registradas){ _ in
                Image(systemName: "hare.fill")
            }
        }
        .padding()
        
        Button("Agrega por favor una serie de prueba"){
            controlador.agregar_serie()
        }
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
