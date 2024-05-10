import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Nodata extends StatefulWidget {
  const Nodata({Key? key}) : super(key: key);

  @override
  State<Nodata> createState() => _NodataState();
}

class _NodataState extends State<Nodata> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(

          child: RiveAnimation.asset("assets/nodataani.riv")),
    );
  }
}
