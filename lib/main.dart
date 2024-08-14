import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controller/user_controller.dart';
import 'model/user_view_model.dart';
import 'provider/theme_provider.dart';
import 'view/user/user_detail_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return MaterialApp(
          title: 'Assessment Task',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Assessment Task'),
          debugShowCheckedModeBanner: false,
        );
      });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserController usercontroller = UserController();
  List<UserViewModel> users = [];
  bool dataLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var users = await usercontroller.fetchUsers();
    setState(() {
      this.users = users;
      dataLoading = false;
      print("usercontroller12345 ${this.users}");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: dataLoading == false
          ? users.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserDetailCard(
                      userDetails: users[index],
                      index: index,
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Ther is no Users...",
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: size.height * 0.002,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Please wait...",
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
