import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/controllers/auth_controller.dart';
import 'package:marketplace/app/modules/home/controllers/home_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:marketplace/app/modules/home/views/favorite_screen.dart';
import 'package:marketplace/app/modules/home/views/home_screen.dart';
import 'package:marketplace/app/modules/home/views/user_screen.dart';
import 'package:marketplace/app/modules/login/views/login_view.dart';
import 'package:marketplace/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController controll = Get.put(HomeController());
  final authControl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFEEDCC6),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bonjour, Amigo",
                  style: GoogleFonts.sora(
                    color: const Color(0xff230C02),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.search, size: 30, color: Color(0xff230C02),),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, size: 30, color: Color(0xff230C02),),
              onPressed: () => Get.toNamed(Routes.NOTIFICATION),
            )
          ],
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: _buildBody(controll.currentNavIndex.value),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xffEEDCC6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 6,
            activeColor: Color(0xff230C02),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Color.fromARGB(255, 177, 165, 149),
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
                iconColor: Color(0xff230C02),
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconColor: Color(0xff230C02),
              ),
            ],
            selectedIndex: controll.currentNavIndex.value,
            onTabChange: (index) {
              controll.currentNavIndex.value = index;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return LoginView();
      case 2:
        return FavoriteScreen();
      case 3:
        return UserScreen();
      default:
        return Container();
    }
  }
}




