import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
 late AnimationController animationController;
 late Animation <Offset> anime;
 late Duration duration = Duration(milliseconds: 1500);


  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: duration);
    anime = Tween(begin: Offset(0,0), end: Offset(1,4)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SlideTransition(
          position: anime,
          child: Container(
            alignment: Alignment.center,
            width: 200,
            height: 100,
            color: Colors.amber,
            child: Text('Hello World'),
          ),
        ),
      );
  }
}