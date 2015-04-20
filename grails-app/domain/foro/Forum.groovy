package foro

class Forum {
	
	String name
	Date dateCreated
	String category

    static belongsTo = [admin:Admin]

    static constraints = {
		name(blank:false,nullable:false,length:3..20,unique:true)
		dateCreated(blank:false,nullable:false,min:new Date())
		category(blank:false,nullable:false,length:3..15)
    }
}
