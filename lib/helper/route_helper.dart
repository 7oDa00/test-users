import 'package:get/get.dart';

import '../views/user_details/users_details.dart';
import '../views/users/users.dart';

class RouteHelper {
  static const String users = '/users';
  static const String userDetails = '/userDetails';

  static String getUsersRoute() => '$users';
  static String getUserDetailsRoute(int id) => '$userDetails?id=$id';

  static List<GetPage> routes = [
    GetPage(name: users, page: () => const UsersScreen()),
    GetPage(name: userDetails, page: () => UsersDetailsScreen(id: int.parse(Get.parameters['id']!))),
  ];
}