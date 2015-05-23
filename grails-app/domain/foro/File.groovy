package foro

class File {
	String fileType
	Byte[] content
	double size
	static belongsTo=[post:Post]
	static mappedBy = [post: "post_belongs_id"]

	static constraints = {
		//fileType validator:{obj->if(obj.fileType.split("/").size()>2)}
		fileType(blank: false, nullable: false, matches: ".+[/]+.+")
		size maxSize:10240, blank:false
		content blank:false
	}
}

