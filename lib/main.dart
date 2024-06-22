import 'package:flutter/material.dart';
import 'package:real_estate_app/dashboard/dashboard.dart';
import 'package:real_estate_app/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Euclid Circular A',
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}














class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  int counter = 10;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
                    
            // Container(
            //   child: ListView.builder(
            //       itemCount: 100,
            //       itemBuilder: (context, index) => ListTile(
            //         title: Text("Item ${index+1}"),
            //       ),
            //     ),
            // ),
               FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  _draggableScrollableController.animateTo(1,
                      duration: Duration(milliseconds: 800), curve: Curves.easeIn);
                },
              ),
            DraggableScrollableSheet(
              controller: _draggableScrollableController,
              minChildSize: 0.1,
              initialChildSize: 0.15,
              maxChildSize: 0.8,
              builder: (context, scrollController) => Material(
                elevation: 8,
                child: ListView.builder(
                  itemCount: 10,
                  controller: scrollController,
                  itemBuilder: (context, index) => ListTile(
                    title: Text("Item ${index+1}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: SizedBox(
      //   height: 150,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       FloatingActionButton(
      //         child: Icon(Icons.arrow_upward),
      //         onPressed: () {
      //           _draggableScrollableController.animateTo(1,
      //               duration: Duration(milliseconds: 800), curve: Curves.easeIn);
      //         },
      //       ),
      //       SizedBox(height: 10,),
      //       FloatingActionButton(
      //         child: Icon(Icons.plus_one),
      //         onPressed: () {
      //           setState(() {
      //             counter += 1;
      //           });
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
