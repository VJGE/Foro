package foro

class Post {
	
	Date dateCreated
	String topic
	Date lastUpdate
	boolean itsAllowed
	Date current=new Date()
	static transients = ['current']
	static belongsto = [regular:Regular,forum:Forum]
	static mappedBy = [regular: "owner_id",forum:"fatherForum_id"]
	static hasMany = [files:File]
	
    static constraints = {
		dateCreated blank:false
		topic blank:false, range:3..50
		itsAllowed nullable:false
		dateCreated min: current
		lastUpdate min:current
		
    }
}
