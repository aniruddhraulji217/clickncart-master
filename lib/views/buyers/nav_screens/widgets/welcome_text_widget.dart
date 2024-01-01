

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 15 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text('Kirtan, What Are You\n Looking For 👀 ',
            style: TextStyle(fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Semi-Bold',
            ),
          ),
          Container(
            child: SvgPicture.asset('assets/images/shopping_cart.svg',
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
