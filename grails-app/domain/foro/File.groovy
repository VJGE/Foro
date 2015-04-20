package foro

class File {
	String fileType
	Byte[] content
	double size

    static belongsTo = [post:Post]
	static mappedBy = [post: "post_belongs_id"]

    static constraints = {
		fileType blank:false, validator:{obj->if(obj.fileType.split("/").size()>2)}
		size max:10485760, blank:false
		content blank:false
    }
}
