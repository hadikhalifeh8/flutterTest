import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:small_tesr/controller/users/ViewController.dart';
import 'package:small_tesr/core/class/statusRequest.dart';
import 'package:small_tesr/core/constant/routes.dart';
import 'package:small_tesr/core/functions/handlingDataController.dart';
import 'package:small_tesr/data/datasource/remote/users/users_data.dart';
import 'package:small_tesr/data/model/usersModel.dart';

class AddUserController extends GetxController {


      UserData userData = UserData(Get.find());

// طريقه جديده
List<UsersModel> data = [];
 StatusRequest statusRequest  = StatusRequest.none;


GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();




    insertData() async{
      
    if(formState.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await userData.postdata(fname.text, lname.text, email.text, phone.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
          ViewUsersController controller = Get.put(ViewUsersController());
                    controller.getallusers();
                     Get.offAllNamed(AppRoute.viewusers);
      }
      else{
      //   Get.defaultDialog(title: "Warning ", middleText: "first Name Already Exists");
      //   statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      // } 
     }
      
      update();

      //Get.offNamed(AppRoute.verifycodesignup,  arguments:{"email": email.text} ); //verifycode لصفحة ال  email ببعت ال 
    }else{
      Get.defaultDialog(title: "Warning ", middleText: "ph / ema @ alrady exists");
       statusRequest = StatusRequest.failure;
      
    }
     update();
  }
    } 

 @override
  void onInit() {
    fname= TextEditingController();
    lname= TextEditingController();
    email= TextEditingController();
    phone= TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }
    }
