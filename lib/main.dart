import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:small_tesr/bindings/initialBinding.dart';
import 'package:small_tesr/routes.dart';
import 'package:small_tesr/view/screen/users/view.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();

 //  await initialServices();

   
//  final myServices = await Myservices().init(); // Call init here

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
                headline1:    TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white,),
                bodyText1:   TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white,),
                      
        ),
        primarySwatch: Colors.blue,
      ),
      home:    const ViewUsers(), // route  بعملها بال  middleware عشان إستخدم ال 
           //Test(),
       initialBinding: InitialBinding(), // delete from memory the previous texts
       
       //routes: routes ,
       getPages: routes,

    );
  }
}


