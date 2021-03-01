import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_p32929/logics/ServerCalling.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/Product.dart';
import 'package:flutter_p32929/screens/BusDetails.dart';
import 'package:flutter_p32929/widgets/Shimmar.dart';
import 'package:http/http.dart' as http;

class CustomeImageSlider extends StatefulWidget {
  @override
  _CustomeImageSliderState createState() => _CustomeImageSliderState();
}

class _CustomeImageSliderState extends State<CustomeImageSlider> {
  List<Product> _products;
  bool _loading = false;
  @override
  void initState() {
    ServerCallings().getProduct().then((value) => {
          if (mounted)
            {
              setState(() {
                _products = value;
                // _loading = true;
                print(_products.length);
              })
            }
        });
    super.initState();
  }

  Widget build(BuildContext context) {
    // print("imageSlider ${StatesManager.states.products.length}");
    return _products?.length == null
        ? Shimmar()
        : Container(
            child: CarouselSlider.builder(
            itemCount: _products.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              Product products = _products[index];
              return InkWell(
                child: Container(
                  child: Center(
                      child: Image.network(products.image,
                          fit: BoxFit.cover, width: 1000)),
                ),
                onTap: () {
                   var name = products;
                  Route route =
                      MaterialPageRoute(builder: (context) => BusDetails(name));
                  Navigator.push(context, route);
                },
              );
            },
          ));
  }
}
