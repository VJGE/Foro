package foro

class FiltrosFilters {

    def filters = {
        //adminFilter(controller: '*', action: 'index', invert: true) {
        adminFilter() {
            before = {/*
                if (!session.authStatus.equals('logged')) {
                    redirect(action: "index")
                    return false
                }
                return true*/
            }
            after = { Map model ->

            }

            afterView = { Exception e ->
            }
        }
    }
}