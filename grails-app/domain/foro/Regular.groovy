package foro

class Regular extends User{
	
	int postViews
	int strikesNumber
	int starsNumbers
	
	static hasMany=[posts: Post]

    static constraints = {
		postViews(blank:false,nullable:false,min:0)
		strikesNumber(blank:false,nullable:false,range:0..3)
		starsNumbers(blank:false,nullable:false,range:0..5)
    }
}
