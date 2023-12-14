import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:small_tesr/controller/users/ViewController.dart';
import 'package:small_tesr/core/class/statusRequest.dart';
import 'package:small_tesr/core/constant/routes.dart';
import 'package:small_tesr/core/functions/handlingDataController.dart';
import 'package:small_tesr/data/datasource/remote/users/users_data.dart';
import 'package:small_tesr/data/model/usersModel.dart';

class EditUserController extends GetxController {


      UserData userData = UserData(Get.find());

// طريقه جديده
List<UsersModel> data = [];
 StatusRequest statusRequest  = StatusRequest.none;

 UsersModel? usersModel;
String? id;

GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();




  edit(String id) async {

    if(formState.currentState!.validate()) // for validation
    {
  



     var response = await userData.editData(id, fname.text,lname.text,email.text, phone.text); //loading هون خلص 


      print("***************##############************* Controler $response ");

     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

    update();

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
      print("yess");

      Get.offNamed(AppRoute.viewusers);

     //to refresh directly when insert data
     
      ViewUsersController controller = Get.find();

      controller.getallusers();

    //to refresh directly when insert data

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات

      print("noo");
           
      }
     }
     
      update(); // Refresh 
    }
  }

 @override
  void onInit() {


    usersModel =Get.arguments["usersModel_"];

    fname= TextEditingController();
    lname= TextEditingController();
    email= TextEditingController();
    phone= TextEditingController();


      // get data from db view to texts in edit
    id = usersModel!.id.toString();
    lname.text =  usersModel!.firstname.toString();
    fname.text =  usersModel!.lastname.toString();
    email.text =  usersModel!.email.toString();
    phone.text =  usersModel!.phoneNumber.toString();


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
