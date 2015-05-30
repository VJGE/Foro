package foro

import grails.transaction.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }

    User login(session, params){
        def user = User.findByUserName(params.userName)
        if (!user){
            return
        }else{
            if(user.password==params.password.encodeAsMD5()) {
                session.authStatus = 'logged'
                return user
            }
            else{
                return
            }
        }
    }

    def logout (session){
        session.authStatus = null
    }

}
