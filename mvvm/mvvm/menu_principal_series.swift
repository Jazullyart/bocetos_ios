//
//  menu_principal_series.swift
//  mvvm
//
//  Created by alumno on 3/21/25.
//

import SwiftUI

struct MenuPrincipalSeries: View {
    @Environment(VistaModeloBasico.self) var controlador
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(controlador.series_registradas){ serie in
                    Image(systemName: "hare.fill")
                }
            }
            .padding()
        }
        
        Spacer()
        
        Button("Agrega por favor una serie de prueba"){
            controlador.cambiar_a_agregar_serie()
        }
    }
}

#Preview {
    MenuPrincipalSeries()
        .environment(VistaModeloBasico())
}
