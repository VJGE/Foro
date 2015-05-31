package foro

import grails.transaction.Transactional

@Transactional
class BuscarService {
    def searchableService
    def buscarForos(params){

        if(!params.textoBusqueda){
            return
        }
        if(params.textoBusqueda==null){
            return
        }else{
            def foros=Forum.search(params.textoBusqueda,[reload: true, result: 'every'])
            //def foros=searchableService.searchEvery(params.textoBusqueda)
            return foros
        }
    }
    def buscarUsuario(params){
        if(!params.textoBusqueda){
            return
        }
        if(params.textoBusqueda==null){
            return
        }else{
            users=User.search(params.textoBusqueda,[reload: true, result:'every'])
            return
        }
    }

    def serviceMethod() {

    }
}
