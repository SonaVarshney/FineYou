import 'package:flutter/material.dart';
import 'size_configs.dart';
import 'education.dart';

class Education2 extends StatefulWidget {
  const Education2({super.key});

  @override
  State<Education2> createState() => _Education2State();
}

class _Education2State extends State<Education2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Education()));
          },
        ),
        title: const Text('Education',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Montserrat',
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: getProportionateScreenHeight(37),
          ),
          Center(
              child: Image.asset(
            'assets/view_more1.png',
            width: getProportionateScreenWidth(382),
          )),
          SizedBox(
            height: getProportionateScreenHeight(22),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Nov 29, 2022 • 3344 views",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          Padding(
            padding: const EdgeInsets.all(21),
            child: Text(
              "Understanding Depression",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Open Sans'),
            ),
          ),
          // SizedBox(height: getProportionateScreenHeight(5)),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                // Text(
                //   "By: Nikita Garg",
                //   style: TextStyle(fontSize: 16),
                // ),
                Spacer(),
                Image.asset(
                  'assets/share.png',
                  width: getProportionateScreenWidth(30),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
                "Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. Also called major depressive disorder or clinical depression, it affects how you feel, think and behave and can lead to a variety of emotional and physical problems. You may have trouble doing normal day-to-day activities.",
                style: TextStyle(
                  //     fontFamily: "Poppins",
                  fontSize: 18,
                  // fontWeight: FontWeight.w00),
                )),
          )
        ]),
      ),
    );
  }
}
