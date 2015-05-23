package foro
class FileFilters {

    def filters = {
        a(controller:'FileController', action:'create') {
            before = {

            }
            after = { Map model ->
                if(size > 10240 || !size || !content){
                    redirect(action: 'create')
                    return false;
                }
                if(fileType!="text/plain" && fileType!="image/png" ){
                    redirect(action: 'create')
                    return false;
                }
            }
            afterView = { Exception e ->

            }
        }
    }
}
