import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/user_details_controller.dart';
import '../../directory/images.dart';
import '../../helper/route_helper.dart';

class UsersDetailsScreen extends StatefulWidget{
  final int id;
  const UsersDetailsScreen({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => UsersDetailsScreenState();
}

class UsersDetailsScreenState extends State<UsersDetailsScreen>{

  @override
  void initState() {
    super.initState();

    Get.lazyPut(() => UserDetailsController(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailsController>(builder: (userDetailsController){
      return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
              userDetailsController.userModel.name
          ),
          automaticallyImplyLeading: true,
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
                    userDetailsController.load();
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
        body: userDetailsController.refreshingData ? const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ) : userDetailsController.id != -1 ? SafeArea(
            bottom: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                      height: 16
                  ),

                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          offset: const Offset(
                              0.0,
                              1.0
                          ),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0
                      ),
                      child: ClipOval(
                        child: SvgPicture.asset(
                          Images.profilePicture,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 16
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 8
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(
                            10.0
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 8,
                                top: 16
                            ),
                            child: Text(
                              "Contact information",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.phone,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.phone,
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.email,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.email,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 16
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 8
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(
                            10.0
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 8,
                                top: 16
                            ),
                            child: Text(
                              "Company information",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.company.name,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.business,
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.company.catchPhrase,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.business,
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.company.bs,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.business,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 16
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 16
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(
                            10.0
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 8,
                                top: 16
                            ),
                            child: Text(
                              "Address information",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.address.street,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                Image.asset(
                                  Images.map,
                                  width: 24,
                                  height: 24,
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.address.suite,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                Image.asset(
                                    width: 24,
                                    height: 24,
                                    Images.street
                                )
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.address.city,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.location_city,
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Text(
                                    userDetailsController.userModel.address.zipcode,
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Theme.of(context).textTheme.bodyText2?.color,
                                      fontSize: 14,
                                    )
                                ),

                                const Expanded(
                                  child: SizedBox(
                                      width: 8
                                  ),
                                ),

                                const Icon(
                                  Icons.numbers,
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: Theme.of(context).dividerColor,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                                16
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "Latitude : ${userDetailsController.userModel.address.geo.lat}",
                                      style: TextStyle(
                                        height: 1.2,
                                        color: Theme.of(context).textTheme.bodyText2?.color,
                                        fontSize: 14,
                                      )
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                      "Longtitud : ${userDetailsController.userModel.address.geo.lng}",
                                      style: TextStyle(
                                        height: 1.2,
                                        color: Theme.of(context).textTheme.bodyText2?.color,
                                        fontSize: 14,
                                      )
                                  ),
                                ),

                                const Icon(
                                  Icons.location_pin,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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