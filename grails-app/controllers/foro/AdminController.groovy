package foro


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdminController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        println "Se va a ejecutar la accion: ${actionUri}"
    }

    def afterInterceptor = { model ->
        println "Se ha ejecutado la accion: ${actionUri}"
    }

    def userAdmin(){}

    def list(){
        respond admins = Admin.list(sort:'level', order: 'asc');
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Admin.list(params), model: [adminInstanceCount: Admin.count()]
    }

    def show(Admin adminInstance) {
        respond adminInstance
    }

    def create() {
        respond new Admin(params)
    }

    @Transactional
    def save(Admin adminInstance) {
        if (adminInstance == null) {
            notFound()
            return
        }

        if (adminInstance.hasErrors()) {
            respond adminInstance.errors, view: 'create'
            return
        }

        adminInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])
                redirect adminInstance
            }
            '*' { respond adminInstance, [status: CREATED] }
        }
    }

    def edit(Admin adminInstance) {
        respond adminInstance
    }

    @Transactional
    def update(Admin adminInstance) {
        if (adminInstance == null) {
            notFound()
            return
        }

        if (adminInstance.hasErrors()) {
            respond adminInstance.errors, view: 'edit'
            return
        }

        adminInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Admin.label', default: 'Admin'), adminInstance.id])
                redirect adminInstance
            }
            '*' { respond adminInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Admin adminInstance) {

        if (adminInstance == null) {
            notFound()
            return
        }

        adminInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Admin.label', default: 'Admin'), adminInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
