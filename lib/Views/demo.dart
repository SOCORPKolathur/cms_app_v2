
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';


class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empty Widget',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Empty widget Flutter'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: EmptyWidget(
            image: null,
            packageImage: PackageImage.Image_2 ,
            title: 'No Data',
            subTitle: 'No Data available yet',
            titleTextStyle: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 31, 150, 47),
              fontWeight: FontWeight.w500,
            ),
            subtitleTextStyle: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 21, 226, 199),
            ),
          ),
        ),
      ),
    );
  }
}
