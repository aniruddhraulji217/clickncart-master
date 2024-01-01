import 'package:clickncart/views/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:clickncart/views/buyers/nav_screens/widgets/category_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                  left: 25,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello Aniruddh, What Are You\nLooking For 👀 ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Semi-Bold',
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(
                        'assets/images/shopping_cart.svg',
                        width: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/search.svg',
                            width: 18,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.black), // Adjust text color
                              decoration: InputDecoration(
                                hintText: 'Search For Products',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.grey, // Adjust hint text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: BannerWidget(), // Modify BannerWidget accordingly
              ),
              SizedBox(height: 20), // Adjust spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: CategoryText(), // Modify CategoryText accordingly
              ),
              // Add your other widgets or modify existing ones
            ],
          ),
        ),
      ),
    );
  }
}
