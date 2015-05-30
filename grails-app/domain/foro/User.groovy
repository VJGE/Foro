package foro

class User {

    String name
    String lastName
    int age
    String userName
    String password



    static constraints = {
        name(blank: false, nullable: false, size: 3..50)
        lastName(blank: false, nullable: false, size: 3..50)
        age(blank: false, nullable: false, min: 14)
        userName(blank: false, nullable: false, unique: true)
        password(blank: false, nullable: false, minSize: 8, password:true)
    }
}
