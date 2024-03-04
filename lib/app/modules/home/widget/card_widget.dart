import 'package:flutter/material.dart';
import 'package:pelajarnupatrang/app/constant/color.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.title, this.route});
  final String title;
  final Function()? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              appBlueLight2,
              appBlueLight1,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: route ?? () {},
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 1,
                    top: -25,
                    child: Image.asset(
                      'assets/img/alquran.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
