//
//  controlador_app.swift
//  redes_sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion {
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    var perfil_a_mostrar: Perfil? = nil
    
    var pagina_resultados: PaginaResultado? = nil
    
    var personaje_seleccionado: MonoChino? = nil
    var transformaciones: Array<Transformacion> = []
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            
            await self.descargar_monos_chinos()
        }
    }
    
    func descargar_monos_chinos() async{
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else { return }
        
        self.pagina_resultados = pagina_descargada
    }
    
    func descargar_info_personaje(id: Int) async {
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else { return }
        
        self.personaje_seleccionado = mono_chino
    }
    
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    func seleccionar_mono_chino(_ personaje: MonoChino) -> Void {
        personaje_seleccionado = personaje
    }
    
    func descargar_transformaciones() async {
        
    }
    
    // Publicaciones
    
    func descargar_publicaciones() async {
        defer {
            print("Esta funcion se mandó a llamar después de todos los await en mi función \(#function)")
        }
        
        guard let publicaciones_dercargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_dercargadas
    }
    
    func descargar_comentarios() async {
        defer {
            print("Esta funcion se mandó a llamar después de todos los await en mi función \(#function)")
        }
        
        guard let comentarios_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else { return }
        
        comentarios = comentarios_descargados
    }
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
    }
    
    func descargar_perfil(id: Int) async -> Void {
        guard let perfil : Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else { return }
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void {
        Task.detached {
            await self.descargar_perfil(id: id)
        }
    }
}
