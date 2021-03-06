package foro


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegularController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        println "Se va a ejecutar la accion: ${actionUri}"
    }

    def afterInterceptor = { model ->
        println "Se ha ejecutado la accion: ${actionUri}"
    }

    def userRegular(){}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Regular.list(params), model: [regularInstanceCount: Regular.count()]
    }

    def show(Regular regularInstance) {
        respond regularInstance
    }

    def create() {
        respond new Regular(params)
    }

    def regularMiPost(){}

    @Transactional
    def save(Regular regularInstance) {
        if (regularInstance == null) {
            notFound()
            return
        }

        if (regularInstance.hasErrors()) {
            respond regularInstance.errors, view: 'create'
            return
        }

        if(params.password ==~ "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])([a-zA-Z0-9]+)"){
            regularInstance.password= regularInstance.password.encodeAsMD5()
            println "${regularInstance.password}"
            regularInstance.save flush: true
        }else{
            flash.message = message('Contraseña inválida')
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'regular.label', default: 'Regular'), regularInstance.id])
                redirect regularInstance
            }
            '*' { respond regularInstance, [status: CREATED] }
        }
    }

    def edit(Regular regularInstance) {
        respond regularInstance
    }

    @Transactional
    def update(Regular regularInstance) {
        if (regularInstance == null) {
            notFound()
            return
        }

        if (regularInstance.hasErrors()) {
            respond regularInstance.errors, view: 'edit'
            return
        }

        regularInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Regular.label', default: 'Regular'), regularInstance.id])
                redirect regularInstance
            }
            '*' { respond regularInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Regular regularInstance) {

        if (regularInstance == null) {
            notFound()
            return
        }

        regularInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Regular.label', default: 'Regular'), regularInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'regular.label', default: 'Regular'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
