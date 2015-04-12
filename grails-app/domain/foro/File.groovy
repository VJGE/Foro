package foro

class File {
	String fileType
	Byte[] content
	double size

    static constraints = {
		fileType blank:false, validator:{obj->if(obj.fileType.split("/").size()>2)}
		size max:10485760, blank:false
		content blank:false
    }
}
