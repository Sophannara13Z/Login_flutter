
import 'package:flutter/material.dart';
import 'package:project1/data/user_share_prefereces.dart';
import 'package:project1/screene/custom_search_delegate.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    String userName = "Guest";

  void initState() {
    super.initState();
    _fetchFullName();
  }

  Future<void> _fetchFullName() async {
    String? name = await UserSharedPreference.getUserData("username");

    if (name != null) {
      setState(() {
        userName = name;
      });
    }
  }
  
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
          "Hi, $userName",
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