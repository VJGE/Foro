package foro

class Admin extends User {

    int level
    float rating

    static hasMany = [forums:Forum]

    static constraints = {
        level(blank: false, min: 1, max: 5)
        rating(blank: false, min:0F, max:100F)
    }
}
