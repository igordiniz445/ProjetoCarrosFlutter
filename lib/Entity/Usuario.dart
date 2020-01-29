import 'package:carros/Preferences/prefs.dart';
import 'dart:convert' as converter;

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
		this.roles = map["roles"]!= null ? List.castFrom(map["roles"]) : null;
	}

	Usuario.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		login = json['login'];
		nome = json['nome'];
		email = json['email'];
		urlFoto = json['urlFoto'];
		token = json['token'];
		roles = json['roles'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['login'] = this.login;
		data['nome'] = this.nome;
		data['email'] = this.email;
		data['urlFoto'] = this.urlFoto;
		data['token'] = this.token;
		data['roles'] = this.roles;
		return data;
	}

	@override
	String toString() {
		return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
	}

  	void save() {
		Map map = toJson();
		String json = converter.json.encode(map);
		Prefs.setString("user.prefs", json);
  	}

  	static Future<Usuario> get() async{
		String json = await Prefs.getString("user.prefs");
		print(json);
		Map map = converter.json.decode(json);
		Usuario user = Usuario.fromJson(map);
		return user;
	}

}