
import 'package:flutter/material.dart';
import 'package:project1/screene/custom_search_delegate.dart';


class HomeScreen extends StatefulWidget {
   final String username; // MODIFIED: To accept username

  // const MainScreen({super.key, required this.username});
  const HomeScreen({super.key,required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          "Hi,  ${widget.username}", // MODIFIED: Use widget.username
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (){
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: Icon(
            Icons.search,
            color: Colors.black,
          ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}