package foro

class Admin extends User {

    int level
    double rating

    static constraints = {
        level(blank: false, min: 1, max: 5)
        rating(blank: false, min:0, max:100)
    }
}
