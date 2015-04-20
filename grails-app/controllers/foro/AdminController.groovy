package foro

class AdminController {

    def list(){
        def admins = Admin.list(sort:'level', order: 'asc');
    }

    def index() {}
}
