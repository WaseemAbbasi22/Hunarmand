class MyUser {
  String email;
  String password;
  String phoneNo;
  String fullName;
  MyUser();
  //user({this.email, this.password,this.phoneNo,this.fullName});

  void setemail(String email) {
    this.email = email;
  }

  void setpassword(String password) {
    this.password = password;
  }

  void setphoneNo(String phoneNo) {
    this.phoneNo = phoneNo;
  }

  void setfullName(String fullName) {
    this.fullName = fullName;
  }

  String getemail() {
    return email;
  }

  String getpassword() {
    return password;
  }

  String getphoneNo() {
    return phoneNo;
  }

  String getfullName() {
    return fullName;
  }
}
