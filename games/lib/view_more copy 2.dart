import 'package:flutter/material.dart';
import 'size_configs.dart';
import 'education.dart';

class Education4 extends StatefulWidget {
  const Education4({super.key});

  @override
  State<Education4> createState() => _Education4State();
}

class _Education4State extends State<Education4> {
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
            child: Center(
              child: Text(
                "Ways to cope with Depression.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Open Sans'),
              ),
            ),
          ),
          // SizedBox(height: getProportionateScreenHeight(5)),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20),
          //   child: Row(
          //     children: [
          //       // Text(
          //       //   "By: Nikita Garg",
          //       //   style: TextStyle(fontSize: 16),
          //       // ),
          //       Spacer(),
          //       Image.asset(
          //         'assets/share.png',
          //         width: getProportionateScreenWidth(30),
          //       )
          //     ],
          //   ),
          // ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(22.0),
            // ignore: prefer_const_constructors
            // RichText(
            //   text: TextSpan(
            //         style: TextStyle(
            //         fontFamily: "Poppins",
            //         fontSize: 18,
            //         fontWeight: FontWeight.w100),
            //      children:[
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Text(' \n'),
              Text(
                'Depression is a serious mental health condition that can affect anyone. It\'s important to be aware of the signs and symptoms of depression so that you can seek help if you or someone you know is struggling. Here are some common signs of depression',
              ),
              Text(
                  '\n 1. Persistent feelings of sadness, emptiness, or hopelessness'),
              // Text('\nPractice mindfulness',
              //     style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  '  2. Loss of interest or pleasure in activities that were once enjoyable.'),
              Text(' 3. Difficulty sleeping or sleeping too much'),
              Text(' 4. Fatigue or lack of energy'),
              // Text('\nGet enough sleep',
              //     style: TextStyle(fontWeight: FontWeight.bold)),
              // Text(
              //     ' Lack of sleep can worsen mental health symptoms. Aim to get seven to eight hours of sleep each night.'),
              // Text('\nConnect with others',
              //     style: TextStyle(fontWeight: FontWeight.bold)),
              // Text(
              //     '  Social support is essential for good mental health. Connect with friends and family, join a support group, or consider seeing a therapist.'),
              // Text('\nPractice self-care:',
              //     style: TextStyle(fontWeight: FontWeight.bold)),
              // Text(
              //     ' Take care of yourself by doing things you enjoy, such as reading, listening to music, or taking a warm bath.'),
              // Text('\nAvoid unhealthy coping mechanisms:',
              //     style: TextStyle(fontWeight: FontWeight.bold)),
              // Text('  Avoid using drugs, alcohol etc'),
            ]

                    //       ],

                    ),

            //   ),
            // )
          )
        ]),
      ),
    );
  }
}
