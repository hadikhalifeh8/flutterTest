
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:small_tesr/core/constant/routes.dart';
import 'package:small_tesr/view/screen/users/add.dart';
import 'package:small_tesr/view/screen/users/view.dart';





List<GetPage<dynamic>>? routes = [

 //  GetPage(name:  "/", page: () => const AdminLogin(), middlewares: [MyMiddleware()]),

    GetPage(name:  AppRoute.viewusers, page: () => const ViewUsers(),),
    GetPage(name:  AppRoute.adduser, page: () => const AddUser(),),

    

















    




















];



