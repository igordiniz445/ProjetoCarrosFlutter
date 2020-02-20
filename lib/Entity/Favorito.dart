
class Favorito{
	int id;
	String nome;

	Favorito.fromMap(Map<String,dynamic> map){
		id = map["id"];
		nome = map["nome"];
	}

	Map<String, dynamic> toMap(){
		final Map<String, dynamic> map = new Map<String, dynamic>();
		map["id"] = id;
		map["nome"] = nome;
		return map;
	}
}