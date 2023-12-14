import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:small_tesr/controller/users/ViewController.dart';
import 'package:small_tesr/core/class/handlingDataView.dart';
import 'package:small_tesr/view/widget/User/CustomListTileUser.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({super.key});

  @override
  Widget build(BuildContext context) {
    ViewUsersController controller = Get.put(ViewUsersController());
    return Scaffold(
      appBar: AppBar(
               title: const Text("Users"),
               centerTitle: true,
                

      ),

      body: 
       
       
            GetBuilder<ViewUsersController>(builder: (controller) =>
            
            HandlingDataView(
              
              statusRequest: controller.statusRequest,  
              
              
              
              widget:     
              
                          ListView(
                            children: [
                             
                                
                               
                              Stack(
                                    children: [
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      
                                                      itemCount: controller.data.length,
                                                      itemBuilder: (context, index) =>
                        CustomListTileUser(
                                    
                                    leading_: controller.data[index].id.toString(),
                                    firstName: controller.data[index].firstname.toString(), 
                                    lastname: controller.data[index].lastname.toString(), 

                                  
                                    




                                    onEdit: (){
                                      controller.goToEditPage(controller.data[index]);
                                      },
          


                                      iconDelete: Icons.delete_forever, 
                                       onDelete: () { 
                                        controller.deletedata(controller.data[index].id.toString());
                                        },
                                          ),
                                        
                                              
                                              
                                              
                                               
                                                  ),
                                                ],
                                  ),
                                ],
                              ),
                            
                          )), 

              
              

              
                     
    

          
floatingActionButton: FloatingActionButton(onPressed: (){
                                  controller.goToaddPage();
                },
                child: Icon(Icons.add)),



    );
  }
}