import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:games/education.dart';
import 'package:games/wordle.dart';
import 'memory_game copy/memory_game.dart';
import 'size_configs.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Education()));
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Games',
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 47, 4, 30),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              children: [
                //2nd
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 155, 52, 138),
                            Color.fromARGB(255, 172, 142, 197)
                          ],
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
                        Center(
                          child: Image.asset(
                            'assets/wordle.png',
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(4)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Wordle',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(30)),
                            IconButton(
                                padding: EdgeInsets.only(top: 9),
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Wordle()));
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //3rd
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                    // padding: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 226, 194, 235),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Image.asset(
                          'assets/slidePuzzle.png',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Image.asset

                              Text(
                                'Memory Tile',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(7)),
                              IconButton(
                                  padding: EdgeInsets.only(top: 15),
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MemoryGame()));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
