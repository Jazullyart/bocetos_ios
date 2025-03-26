//
//  redes_socialesApp.swift
//  redes_sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

@MainActor
struct redes_socialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            GeneralPublicaciones()
                .environment(controlador)
        }
    }
}
