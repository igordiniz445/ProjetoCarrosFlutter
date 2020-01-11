class Usuario {
	int id;
	String login;
	String nome;
	String email;
	String urlFoto;
	String token;
	List <String> roles;

	Usuario(Map<String, dynamic> map){
		this.id = map["id"];
		this.login = map["login"];
		this.nome = map["nome"];
		this.email = map["email"];
		this.urlFoto = map["urlFoto"];
		this.token = map["token"];
		this.roles = List.castFrom(map["roles"]);
	}

	@override
	String toString() {
		return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
	}


}