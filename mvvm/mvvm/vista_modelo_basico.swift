//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//
import Foundation

@Observable
class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("Hola mundo desde el controlador")
        series_registradas.append(InformacionSerie(nombre: "Prueba", tipo: "prueba", fecha_estreno: 2017, sinopsis: "Aqui va una sipnosis muy larga", caratula: "Image"))
    }
}
