class UserEntity{
 String? fullName;
 String? email;
 String? password;
 String? phone;
 String? bvn;

 UserEntity({this.fullName, this.email, this.password, this.phone, this.bvn});

 Map<String,dynamic> toJson(){
  return {
   "fullName" : fullName,
   "email": email,
   "password":password,
   "phone":phone,
   "bvn" : bvn
  };
 }
}