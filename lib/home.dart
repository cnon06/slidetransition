import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
 late AnimationController animationController;
 late Animation <Offset> anime;
 late Duration duration = const Duration(milliseconds: 1500);


  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: duration);
    anime = Tween(begin: const Offset(0,0), end: const Offset(1,4)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SlideTransition(
          position: anime,
          child: Container(
            alignment: Alignment.center,
            width: 200,
            height: 100,
            color: Colors.amber,
            child: const Text('Hello World'),
          ),
        ),
      );
  }
}