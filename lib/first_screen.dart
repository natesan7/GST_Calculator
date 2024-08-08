import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gst/gst.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home page after 2 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => gst()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1,
                width: MediaQuery.of(context).size.width/1,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("picture/gst.gif"),
                //     fit: BoxFit.fill,
                //   ),
                // ),
                child: FadeTransition(
                  opacity: _animation,
                  child: Center(
                    child: Image.asset("picture/gst.gif",
                      height: 430,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
            ),
        );
    }
}