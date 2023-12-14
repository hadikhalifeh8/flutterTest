
import 'package:small_tesr/core/class/crud.dart';
import 'package:small_tesr/linkapi.dart';

class UserData {

  Crud crud;
  UserData(this.crud);

  getData() async {
   var response = await crud.postData(Applink.viewUsers ,{});
      return response.fold((l) => l, (r) => r);
  }


  
    postdata(String firstName, String lastName, String email,String phoneNumber ) async {
   // var response = await crud.postData(linkurl, {})
   var response = await crud.postData(Applink.addUser,{ // data from backend(nafs l 2asma2)

            "firstName" : firstName,        // name from backend / php  :name from controller
            "lastName" : lastName , //   email from backend / php:email from controller
            "email" :email , //  phone_no from backend / php  : phoneno from controller
            "phoneNumber" : phoneNumber, // password from backend / php : password from controller

   });
      return response.fold((l) => l, (r) => r);
  }



  editData(String userid, String firstName, String lastName, String email,String phoneNumber) async {

  
 
  var  response = await crud.postData('${Applink.editUser}/$userid', {"firstName":firstName,"lastName":lastName,"email":email, "phoneNumber":phoneNumber});
      
   return response.fold((l) => l, (r) => r);
}

  deleteData(String userid) async {

var response = await crud.postData('${Applink.deleteuser}/$userid', {});
return response.fold((l) => l, (r) => r);
}
  
}