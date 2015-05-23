package foro

class Post {
	
	Date dateCreated
	String topic
	Date lastUpdate
	boolean itsAllowed
	Date current=new Date()
	static transients = ['current']
	static belongsTo = [regular:Regular,forum:Forum]
	static mappedBy = [regular:"owner_id",forum:"fatherForum_id"]
	static hasMany = [files:File]
	
    static constraints = {
		dateCreated blank:false
		topic blank:false, rangesize:3..50
		itsAllowed nullable:false
		dateCreated min: current
		lastUpdate min:current
		
    }
	
	def Post(String topc,boolean allowed,ownerid,forumid){
		current=DateGroovyMethods.format(new Date(), 'MM/dd/yyyy HH:mm:ss')
		topic=topc
		itsAllowed=allowed
		regular=ownerid
		forum=forumid
		dateCreated=DateGroovyMethods.format(new Date(), 'MM/dd/yyyy HH:mm:ss')
		lastUpdate=DateGroovyMethods.format(new Date(), 'MM/dd/yyyy HH:mm:ss')
		
	}
	
}
