import 'package:bite_box/pages/screen/food_app_home_screen.dart';
import 'package:bite_box/pages/screen/profile_screen.dart';
import 'package:bite_box/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    FoodAppHomeScreen(),
    Scaffold(),
    ProfileScreen(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItems(Iconsax.home_15, 'A', 0),
            SizedBox(width: 10),
            _buildNavItems(Iconsax.heart, 'B', 1),
            SizedBox(width: 90),
            _buildNavItems(Icons.person_outline, 'C', 2),
            SizedBox(width: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildNavItems(Iconsax.shopping_cart, 'D', 3),
                Positioned(
                  right: -7,
                  top: 16,
                  child: CircleAvatar(
                    backgroundColor: red,
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),

                Positioned(
                  right: 155,
                  top: -25,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: red,
                    child: Icon(
                      CupertinoIcons.search,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItems(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: currentIndex == index ? red : Colors.grey,
          ),
          SizedBox(height: 3),
          CircleAvatar(
            radius: 3,
            backgroundColor: currentIndex == index ? red : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
