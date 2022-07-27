import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: CarouselSlider(
          options:
              CarouselOptions(enlargeCenterPage: true, height: MediaQuery.of(context).size.height, viewportFraction: 1),
          items: [
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "RED",
                  style: TextStyle(fontSize: 54, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "GREEN",
                  style: TextStyle(fontSize: 54, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "BLUE",
                  style: TextStyle(fontSize: 54, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "YELLOW",
                  style: TextStyle(fontSize: 54, color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "BLACK",
                  style: TextStyle(fontSize: 54, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text(
                  "GREY",
                  style: TextStyle(fontSize: 54, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
