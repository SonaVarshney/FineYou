import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:games/games.dart';
import 'memory_game_data.dart';
import 'tile_model.dart';
import 'package:games/size_configs.dart';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  @override
  void initState() {
    // setState(() {
    super.initState();
    pairs = getPairs();
    pairs.shuffle();
    // points = 0;

    visiblePairs = pairs;
    selected = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
      });
    });
    // });
  }

  void _replayGame() {
    setState(() {
      points = 0;
      initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Games()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Memory Game',
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.black,
              fontFamily: 'Montserrat',
            )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            points != 800
                ? Column(
                    children: [
                      Text("$points/800",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500)),
                      Text("Points"),
                    ],
                  )
                : Container(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            points != 800
                ? GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 0.0, maxCrossAxisExtent: 100),
                    children: List.generate(visiblePairs.length, (index) {
                      return Tile(
                        imageAssetPath: visiblePairs[index].getImageAssetPath(),
                        // selected: visiblePairs[index].getIsSelected(),
                        parent: this,
                        tileIndex: index,
                      );
                    }),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(220),
                      ),
                      Text("You Won!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            points = 0;
                            initState();
                          });
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 58, 49, 184),
                              borderRadius: BorderRadius.circular(24)),
                          child: Text('Play Again',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  // const Tile({super.key});
  String imageAssetPath;
  int tileIndex;
  _MemoryGameState parent;
  Tile(
      {required this.imageAssetPath,
      required this.parent,
      required this.tileIndex});
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          if (selectedImageAssetPath != "") {
            if (selectedImageAssetPath ==
                pairs[widget.tileIndex].getImageAssetPath()) {
              //correct
              print("correct");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                points = points + 100;

                setState(() {});
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetPath("");
                  pairs[selectedTileIndex].setImageAssetPath("");
                });
                selectedImageAssetPath = "";
              });
            } else {
              //wrong choice
              print("wrong choice");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });

                selectedImageAssetPath = "";
              });
            }
          } else {
            selectedTileIndex = widget.tileIndex;
            selectedImageAssetPath =
                pairs[widget.tileIndex].getImageAssetPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });

          print("you clicked me");
        }
      },
      child: Container(
          margin: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 154, 183, 235),
            child: pairs[widget.tileIndex].getImageAssetPath() != ""
                ? Image.asset(pairs[widget.tileIndex].getIsSelected()
                    ? pairs[widget.tileIndex].getImageAssetPath()
                    : widget.imageAssetPath)
                : Image.asset("assets/blue_tick.jpg"),
          )),
    );
  }
}
