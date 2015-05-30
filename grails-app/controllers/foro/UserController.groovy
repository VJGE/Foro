package foro


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static scaffold = User

    def login(){};
    def LoginService
    def BuscarService

    def buscar(){
        BuscarService.buscarUsuarios(params)
    }

    def perfil(){
        def user = session.user
        if (user.class == Admin) {
            redirect(controller: 'admin', action: 'userAdmin')
        } else {
            if (user.class == Regular) {
                redirect(controller: 'regular',action: 'userRegular')
            } else {
                render(view: '/index')
            }
        }
    };

    def handleLogin(){
        if (session.authStatus == 'logged'){
            render(view: '/error')
        }
        else {
            if(!params.userName || !params.password){
                redirect(action: 'login')
            }
            else {
                def user = LoginService.login(session, params)
                if (!user) {
                    flash.message = 'No se encontró el usuario'
                    render(view: '/error')
                    return flash.message
                } else {
                    session.user = user
                    render(view: '/index')
                }
            }
        }
    }

    def logout(){
        LoginService.logout(session)
        if(session.user){
            session.user=null
            redirect(action:'login')
        }
    }

    def beforeInterceptor = {
        println "Se va a ejecutar la accion: ${actionUri}"
    }

    def afterInterceptor = { model ->
        println "Se ha ejecutado la accion: ${actionUri}"
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }
        //def contra = params.password
        //params.password=params.password.encodeAsMD5()
        //params.password = contra

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
