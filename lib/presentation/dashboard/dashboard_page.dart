import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CarouselSlider(
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          height: 300.0,
          items: [
            "https://via.placeholder.com/400/0000FF/808080",
            "https://via.placeholder.com/400/FF0000/FFFFFF",
            "https://via.placeholder.com/400/FFFF00/000000",
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image(image: NetworkImage(i),)
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

