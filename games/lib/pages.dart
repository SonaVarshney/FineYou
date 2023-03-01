import 'package:flutter/material.dart';
// import 'package:main_app/utils/size_configs.dart';
import 'view_more.dart';
import 'size_configs.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      width: getProportionateScreenWidth(341),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 155, 52, 138),
              Color.fromARGB(255, 172, 142, 197)
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 6, 3, 2),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: Image.asset(
                    'assets/carousel1.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 0, 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Depression',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      // SizedBox(height: getProportionateScreenHeight(6)),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: SizedBox(
                          width: getProportionateScreenWidth(150),
                          child: const Text(
                            'Depression is more than just feeling down or having a bad day.',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFamily: 'Montessrat',
                                fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(300)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Education2()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
