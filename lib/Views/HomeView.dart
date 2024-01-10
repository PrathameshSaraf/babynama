import 'dart:convert';
import 'package:icon_forest/amazingneoicons.dart';
import 'package:babynama/Model/service_model.dart';
import 'package:babynama/themes/app_colors.dart';
import 'package:babynama/themes/extension.dart';
import 'package:babynama/viewModel/HomeviewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:babynama/Model/service_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../themes/app_text.dart';
class HomeView extends StatelessWidget {
   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: ()=>HomeViewModel(),
        builder: (context,viewmodel, child){
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: context.colorScheme.appBackGroundColor,
            body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 64).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wHeading(context),
                      32.verticalSpace,
                      32.verticalSpace,
                      wBillPaymentsForYou(context),
                      32.verticalSpace,
                    ],
                  ),
                )),
            bottomNavigationBar: buildBottomNavigationBar(),
          );
        });
  }
}

Widget buildBottomNavigationBar() {
  int currentIndex=0;
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index) {
      // Handle onTap actions here
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ],
  );
}
Widget wHeading(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 24),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText("Hello", context, fontWeight: FontWeight.w700).heading3,
            4.verticalSpace,
            AppText("Prathamesh Saraf  |  M", context, fontWeight: FontWeight.w700).heading5,
          ],
        ),
        const Spacer(),
        Column(
          children: [
            10.verticalSpace,
            GestureDetector(
              onTap: () {
                locator<NavigationService>()
                    .navigateTo(Routes.profileView);
                print("hhhh");
              },
              child: Icon(
                Icons.person,
                color: context.colorScheme.appButtonTextColor,
                size: 32,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Column wBillPaymentsForYou( BuildContext context) {
  List<dynamic> babyName = jsonDecode(babynama);
  // Ensure the correct type by casting each element to Map<String, dynamic>
  List<Map<String, dynamic>> babyName1 = babyName.cast<Map<String, dynamic>>();
  List<Icon> licon=[
    Icon(Icons.message_rounded),
    Icon(Icons.medical_services),
    Icon(Icons.music_note),
    Icon(Icons.check_box_outline_blank_sharp),
    Icon(Icons.vaccines),
    Icon(Icons.people),
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20).r,
        child: AppText("Services for you", context,
            fontWeight: FontWeight.w600)
            .heading5,
      ),
      14.verticalSpace,
      GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 11.h,
          mainAxisSpacing: 18.h,
          childAspectRatio: 1.3.h,
          padding: const EdgeInsets.only(left: 11, right: 11).r,
          children:
          List.generate(babyName.length, (index) {
            return GestureDetector(
              onTap: () {
                index==4?locator<NavigationService>()
                    .navigateTo(Routes.vaccineTrackerPage):
                locator<NavigationService>()
                     .navigateTo(Routes.autismView);
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                fit: StackFit.expand,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8)),
                        color:Color(int.parse(babyName[index]["scolor"]["color"].substring(1, 7), radix: 16) + 0xFF000000)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16).r,
                      child: AppText(
                          babyName[index]['name'],
                          context,
                          color: Colors.white)
                          .heading5,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 76.h,
                      width: 58.w,
                      decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(4)),
                           ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:licon[index]
                      ),
                      ),
                    ),
                ],
              ),
            );
          })),
    ],
  );
}
