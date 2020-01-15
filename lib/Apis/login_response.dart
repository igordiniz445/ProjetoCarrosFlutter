class LoginResponse <T> {
	bool ok;
	String message;
	T result;

	LoginResponse.ok(this.result){
		this.ok = true;
	}
	LoginResponse.error(this.message){
		this.ok = false;
	}
}