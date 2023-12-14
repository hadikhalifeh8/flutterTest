
import 'package:get/get.dart';
import 'package:small_tesr/core/class/statusRequest.dart';
import 'package:small_tesr/core/constant/routes.dart';
import 'package:small_tesr/core/functions/handlingDataController.dart';
import 'package:small_tesr/data/datasource/remote/users/users_data.dart';
import 'package:small_tesr/data/model/usersModel.dart';

class ViewUsersController extends GetxController {

    UserData userData = UserData(Get.find());

// طريقه جديده
List<UsersModel> data = [];
 StatusRequest statusRequest  = StatusRequest.none;

  // TextEditingController fname = TextEditingController();
  // TextEditingController lname = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController phone = TextEditingController();


  
  getallusers() async{
    data.clear(); //القديم select لحتى يمحي ال 
                    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
      //var response = await itemsData.getData(category_id ,myServices.sharedPreferences.getString("id")); //loading هون خلص 
      var response = await userData.getData(); //loading هون خلص 

     print("***************##############************* Controler $response ");
     
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
            List responsedata = response['data'];
        data.addAll(responsedata.map((e) => UsersModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     }
      update(); // Refresh 
  }



    deletedata(String id)async
  {
    
     var response = await userData.deleteData(id); //loading هون خلص // delete from db 

        print("***************##############************* Controler $response ");


     data.removeWhere((element) =>  element.id.toString() == id.toString()); // delete from ui
     update();
  }

  goToaddPage()
  {
    Get.toNamed(AppRoute.adduser);
    
  }

      goToEditPage(UsersModel usersModel)
  {
    Get.toNamed(AppRoute.editUser, 
                   arguments: {
                    "usersModel_" : usersModel,
                   }
                      );
  }




@override
  void onInit() {
    getallusers();
    super.onInit();
  }

}