import 'package:flutter/material.dart';

class CategoryText extends StatefulWidget {
  @override
  _CategoryTextState createState() => _CategoryTextState();
}

class _CategoryTextState extends State<CategoryText> {
  final List<String> _categorylable = ['Men', 'Women', 'Kids', 'women', 'kids', 'women', 'kids'];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 19),
          ),
          Container(
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _categorylable.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100, // Set a fixed width for all containers
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ActionChip(
                            backgroundColor: Colors.yellow.shade900,
                            onPressed: () {},
                            label: Center(
                              child: Text(
                                _categorylable[index],
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Scroll the ListView when the arrow icon is tapped
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
