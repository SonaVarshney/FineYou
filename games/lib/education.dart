import 'package:flutter/material.dart';
import 'package:games/daily_routine.dart';
import 'package:games/games.dart';
import 'package:games/pages2.dart';
import 'package:games/pages3.dart';
import 'size_configs.dart';
import 'view_more.dart';
import 'pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'FineYou',
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.black,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        // brightness:brightness.light
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(250),
                child: PageView(
                  controller: _controller,
                  children: const [
                    Page1(),
                    Page3(),
                    Page2(),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const SwapEffect(
                    activeDotColor: Color.fromARGB(218, 84, 51, 228),
                    dotColor: Color.fromARGB(255, 209, 208, 208),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Features',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              SizedBox(
                height: getProportionateScreenHeight(350),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      // padding: EdgeInsets.only(bottom: 7),
                      width: getProportionateScreenWidth(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 226, 194, 235),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: getProportionateScreenHeight(3)),
                          Image.asset('assets/1st.png'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Image.asset
                              const Text(
                                'Games',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(25)),
                              IconButton(
                                  padding: const EdgeInsets.only(top: 15),
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Games()));
                                  },
                                  icon: const Icon(Icons.arrow_forward,
                                      size: 18)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      width: getProportionateScreenWidth(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 226, 194, 235),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/5.png',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //Image.asset

                              SizedBox(
                                width: getProportionateScreenWidth(95),
                                child: const Text(
                                  'Daily Routine',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(4)),
                              IconButton(
                                  hoverColor: Colors.transparent,
                                  padding: const EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerRight,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DailyRoutine()));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(50)),
            ],
          ),
        ),
      ),
    );
  }
}
