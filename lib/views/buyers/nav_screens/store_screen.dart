import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<String> items = [];
  TextEditingController itemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse('http://your-backend-api/items'));
    if (response.statusCode == 200) {
      setState(() {
        items = List<String>.from(json.decode(response.body));
      });
    }
  }

  void addItem() async {
    final response = await http.post(
      Uri.parse('http://your-backend-api/add_item'),
      body: {'item': itemController.text},
    );
    if (response.statusCode == 200) {
      fetchData();
      itemController.clear();
    }
  }

  void deleteItem(String item) async {
    final response = await http.post(
      Uri.parse('http://your-backend-api/delete_item'),
      body: {'item': item},
    );
    if (response.statusCode == 200) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: itemController,
                    decoration: InputDecoration(labelText: 'Enter Item'),
                  ),
                ),
                ElevatedButton(
                  onPressed: addItem,
                  child: Text('Add Item'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteItem(items[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
