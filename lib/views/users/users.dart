import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_users/helper/route_helper.dart';

import '../../controller/users_controller.dart';
import '../../directory/colors.dart';
import '../../directory/images.dart';

class UsersScreen extends StatelessWidget{
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (usersController){
      return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: const Text(
              "Users"
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    top: 12,
                    bottom: 12
                ),
                child: InkWell(
                  onTap: (){
                    usersController.load();
                  },
                  child: Image.asset(
                    Images.refresh,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    width: 24,
                    height: 24,
                  ),
                )
            ),
          ],
        ),
        body: usersController.refreshingData ? const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ) : usersController.users.isNotEmpty ? ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: usersController.users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: index == 0 ? 16 : 8,
                    bottom: index == usersController.users.length - 1 ? 16 : 8,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(RouteHelper.getUserDetailsRoute(usersController.users[index].id));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(
                              8.0
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.12
                              ),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(
                                  0,
                                  3
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              bottom: 16,
                              top: 16,
                              start: 16,
                              end: 16
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        usersController.users[index].name,
                                        style: TextStyle(
                                            height: 1.2,
                                            color: Theme.of(context).textTheme.bodyText1?.color,
                                            fontSize: 15
                                        )
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                        usersController.users[index].phone,
                                        style: TextStyle(
                                          height: 1.2,
                                          color: Theme.of(context).textTheme.bodyText2?.color,
                                          fontSize: 14,
                                        )
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.navigate_next_outlined
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 48,
                height: 48,
                child: SvgPicture.asset(
                  Images.noData,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
              ),
            ),

            const Padding(
                padding: EdgeInsets.only(
                    top: 8, bottom: 8
                )
            ),

            Text(
                "Oops!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                )
            ),

            const Padding(padding: EdgeInsets.only(top: 2, bottom: 2)),

            Text(
                "No data available",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                )
            ),
          ],
        ),
      );
    });
  }
}