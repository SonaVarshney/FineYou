import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/bloc/wordle_bloc.dart';
import 'games.dart';
import 'size_configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class Wordle extends StatelessWidget {
  const Wordle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordleBloc()..add(LoadGame()),
      child: Scaffold(
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
          title: Text('Wordle',
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.black,
                fontFamily: 'Montserrat',
              )),
        ),
        body: SizedBox.expand(child: BlocBuilder<WordleBloc, WordleState>(
          builder: (context, state) {
            double width = MediaQuery.of(context).size.width * .6 / 5;
            Size size = Size(width * 5, width * 6.5);

            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(children: [
              SizedBox(height: getProportionateScreenHeight(60)),
              Container(
                height: getProportionateScreenHeight(420),
                width: getProportionateScreenWidth(350),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 155, 52, 138),
                        Color.fromARGB(255, 172, 142, 197)
                      ],
                    )),
                child: Container(
                  child: SizedBox.fromSize(
                    // size: Size(400, 500),
                    child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: _buildGrid(state),
                    ),
                  ),
                ),
              ),
              if (state.status.isPlaying) ...[
                Text(state.errorMsg,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                const KeyBoard(),
              ] else if (state.status.isFinsished) ...[
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                const Text(
                  'Game Over',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  state.status.isFinishedWon
                      ? 'You won in ${state.guessNo + 1}!'
                      : 'You lost. The word was ${state.word}.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<WordleBloc>().add(RestartGame());
                  },
                  child: const Text('Play again'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 58, 49, 184),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ]
            ]);
          },
        )),
      ),
    );
  }
}

class KeyBoard extends StatelessWidget {
  const KeyBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyBoardKey(letter: 'q'),
            KeyBoardKey(letter: 'w'),
            KeyBoardKey(letter: 'e'),
            KeyBoardKey(letter: 'r'),
            KeyBoardKey(letter: 't'),
            KeyBoardKey(letter: 'y'),
            KeyBoardKey(letter: 'u'),
            KeyBoardKey(letter: 'i'),
            KeyBoardKey(letter: 'o'),
            KeyBoardKey(letter: 'p'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyBoardKey(letter: 'a'),
            KeyBoardKey(letter: 's'),
            KeyBoardKey(letter: 'd'),
            KeyBoardKey(letter: 'f'),
            KeyBoardKey(letter: 'g'),
            KeyBoardKey(letter: 'h'),
            KeyBoardKey(letter: 'j'),
            KeyBoardKey(letter: 'k'),
            KeyBoardKey(letter: 'l'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyBoardKey(letter: 'ent'),
            KeyBoardKey(letter: 'z'),
            KeyBoardKey(letter: 'x'),
            KeyBoardKey(letter: 'c'),
            KeyBoardKey(letter: 'v'),
            KeyBoardKey(letter: 'b'),
            KeyBoardKey(letter: 'n'),
            KeyBoardKey(letter: 'm'),
            KeyBoardKey(letter: 'del'),
          ],
        ),
      ],
    );
  }
}

class KeyBoardKey extends StatelessWidget {
  final String letter;
  const KeyBoardKey({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget keyChar = Text(letter.toUpperCase());
    if (letter == 'ent') {
      keyChar = const Icon(Icons.done, size: 15);
    } else if (letter == 'del') {
      keyChar = const Icon(Icons.backspace, size: 15);
    }
    return GestureDetector(
      onTap: () {
        if (letter == 'ent') {
          context.read<WordleBloc>().add(SubmitGuess());
        } else if (letter == 'del') {
          context.read<WordleBloc>().add(DeleteLetter());
        } else {
          context.read<WordleBloc>().add(EnterLetter(letter: letter));
        }
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(5),
        ),
        width: 30,
        height: 45,
        alignment: Alignment.center,
        child: keyChar,
      ),
    );
  }
}

List<Widget> _buildGrid(WordleState state) {
  List<Widget> grid = [];
  for (var box in state.grid) {
    grid.add(AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: _transitionBuilder,
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack.flipped,
      layoutBuilder: (widget, list) => Stack(
        children: [widget!, ...list],
      ),
      child: box.status.isBlank || box.status.isAnswered
          ? Container(
              key: const Key('front'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                box.letter.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            )
          : Container(
              // key: const Key('back'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                ),
                color: _getColor(box.status),
              ),
              alignment: Alignment.center,
              child: Text(
                // box.letter,
                box.letter.toUpperCase(),
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
    ));
  }

  return grid;
}

Color _getColor(BoxStatus status) {
  if (status.isCorrect) {
    return Colors.orange;
  } else if (status.isOrder) {
    return Colors.green;
  } else if (status.isIncorrect) {
    return Colors.grey;
  } else {
    return Colors.white;
  }
}

Widget _transitionBuilder(Widget widget, Animation<double> animation) {
  final rotation = Tween(begin: pi, end: 0.0).animate(animation);
  return AnimatedBuilder(
      animation: rotation,
      child: widget,
      builder: (context, widget) {
        final under = const Key('back') != widget!.key;
        final value = under ? min(rotation.value, pi / 2) : rotation.value;
        return Transform(
          transform: Matrix4.rotationX(value),
          child: widget,
          alignment: Alignment.center,
        );
      });
}
