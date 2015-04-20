package foro

class Post {
	
	Date dateCreated
	String topic
	Date lastUpdate
	boolean itsAllowed
	Date current=new Date()
	static transients = ['current']

    static hasMany = [files:File]
	
    static constraints = {
		dateCreated blank:false
		topic blank:false, range:3..50
		itsAllowed nullable:false
		dateCreated min: current
		lastUpdate min:current
		
    }
}
