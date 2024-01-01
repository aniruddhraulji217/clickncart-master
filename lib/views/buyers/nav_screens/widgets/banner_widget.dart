import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> _bannerImage = [];
  int _currentPage = 0;

  Future<void> getBanners() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('banners').get();
    querySnapshot.docs.forEach((doc) {
      setState(() {
        _bannerImage.add(doc['image']);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _bannerImage.isEmpty
                ? Center(child: CircularProgressIndicator())
                : PageView.builder(
                    itemCount: _bannerImage.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          _bannerImage[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _bannerImage.length,
                (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
