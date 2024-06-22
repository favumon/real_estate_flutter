import 'package:flutter/material.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key});

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  double textFieldHeight=0;
  double textFieldWidth=0;


  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {
      textFieldHeight=50;
      textFieldWidth=500;
    }),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 100,
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
          height: textFieldHeight,
          width: textFieldWidth,
                padding: EdgeInsets.all(10),

          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white
          ),
          child: Row(
            children: [
              FittedBox(
                child: Icon(
                  Icons.search_rounded,
                  color: Color(0xffA4957E),
                ),
              ),
              SizedBox(width: 10,),
              FittedBox(child: Text('Saint Petersburg'),)
            ],
          )
      
          //  TextFormField(
          //                     initialValue: 'Saint Petersburg',
          //                     style: const TextStyle(color: Color(0xffA5957E)),
          //                     decoration: const InputDecoration(
          //                       isDense: true,
          //                       prefixIcon: Icon(
          //                         Icons.search_rounded,
          //                         color: Color(0xffA4957E),
          //                       ),
          //                       filled: true,
          //                       fillColor: Color(0xffFDFDFC),
          //                       border: OutlineInputBorder(
          //                         borderSide: BorderSide.none,
          //                         borderRadius: BorderRadius.all(
          //                           Radius.circular(40.0),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          ),
    );
  }
}
