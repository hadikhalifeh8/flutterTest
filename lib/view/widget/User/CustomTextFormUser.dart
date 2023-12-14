import 'package:flutter/material.dart';

class CustomTextFormUser extends StatelessWidget {
  final String label_;
  final String hintText_;
  final String? Function(String?)? validation; 
  final  TextEditingController? mycontroller;
  final void Function()? onTap_;
  final bool isNumber;

   

  const CustomTextFormUser({
    super.key,
     required this.label_, 
     required this.hintText_, 
     required this.validation,
     required this.mycontroller, 
     this.onTap_, 
     required this.isNumber, 


      });

  @override
  Widget build(BuildContext context) {
    return       Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                 child: 

                  TextFormField(
                    controller: mycontroller,
                    validator: validation,
                  
                    
              keyboardType: isNumber ?const TextInputType.numberWithOptions(decimal: true) 
                                     :   TextInputType.text, 
 

                    decoration:
                       InputDecoration(
                        
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                       contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                      
                       label: Text(label_),
                       hintText: hintText_,
                       
                       
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                       ),
      ),
      );
  }
}