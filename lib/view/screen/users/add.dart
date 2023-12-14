import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:small_tesr/controller/users/addController.dart';
import 'package:small_tesr/core/class/handlingDataView.dart';
import 'package:small_tesr/core/functions/validationinput.dart';
import 'package:small_tesr/view/widget/User/CustomButton.dart';
import 'package:small_tesr/view/widget/User/CustomTextFormUser.dart';




class AddUser  extends StatelessWidget {
  const AddUser ({super.key});

  @override
  Widget build(BuildContext context) {

     Get.lazyPut(() =>AddUserController());
    return Scaffold(appBar: AppBar(

      title: const Text("Add User"),
      centerTitle: true,
    ),

    body:
          GetBuilder<AddUserController>(builder: (controller)
          =>


             //    if(controller != null) {
          HandlingDataRequest(
            
            statusRequest: controller.statusRequest,
            
            
             widget:  Form(
      key: controller.formState,
       child: ListView(children: [
     




      CustomTextFormUser(
                                 label_: "First name", 
                                 hintText_: "Enter First Name", 
                                 validation: (val){
                                  return valiInput(val!, 4, 20, "name");
                                 }, 
                                 mycontroller: controller.fname,
                                 
                                 isNumber: false, 
                                 
                                 //onTap_: () { }, 
                                 ),


      CustomTextFormUser(
                                 label_: "Last name", 
                                 hintText_: "Enter Last Name", 
                                 validation: (val){
                                  return valiInput(val!, 4, 20, "name");
                                 }, 
                                 mycontroller: controller.lname,
                                 
                                 isNumber: false, 
                                 
                                 //onTap_: () { }, 
                                 ),

      CustomTextFormUser(
                                 label_: "email", 
                                 hintText_: "Enter email", 
                                 validation: (val){
                                  return valiInput(val!, 4, 20, "email");
                                 }, 
                                 mycontroller: controller.email,
                                 
                                 isNumber: false, 
                                 
                                 //onTap_: () { }, 
                                 ),  



      CustomTextFormUser(
                                 label_: "phone", 
                                 hintText_: "Enter Phone Number", 
                                 validation: (val){
                                  return valiInput(val!, 4, 20, "phone");
                                 }, 
                                 mycontroller: controller.phone,
                                 
                                 isNumber: true, 
                                 
                                 //onTap_: () { }, 
                                 ),                   
     
     

     
     
     
       
     
     
     
     CustomButton(
                  onPressed_: (){
                    controller.insertData();
                    }, 
                  text_: "Submit",
                  ),
         
     
         ],),
     ),)
    

          

 
          ),
    

    
    );
  }
}