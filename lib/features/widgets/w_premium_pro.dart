import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PremiumProWidget {
  static Widget premiumProWidget() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 170.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: [
        Container(
          width: 400,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/aksiya.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/images/img_4.png",
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20,
                left: 35,
                child: Column(
                  children: [
                    const Text(
                      'MacBook Pro',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        margin: const EdgeInsets.only(
                          right: 18,
                        ),
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Text(
                          'Tampilan Premium',
                          style: TextStyle(
                            color: Color(0xFF242424),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Image.asset(
              "assets/images/lenovo-1.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Image.asset(
              "assets/images/watch.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Image.asset(
              "assets/images/aksiya.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Image.asset(
              "assets/images/ROG-Banner.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Image.asset(
              "assets/images/iphone-14-apple-repair-price-update.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Image.asset(
              "assets/images/watchc.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
