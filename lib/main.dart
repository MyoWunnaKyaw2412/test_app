import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List MyNum = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List NewArr = [1, 2, 3];
  var eng_num = 1;
  var score = 0;

  void GetRandom() {
    MyNum.shuffle(); // 1-9 Random
    NewArr = MyNum.sublist(0, 3); // first 3 nums
    NewArr.shuffle();
    eng_num = NewArr[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Myanmar Number"),
      ),
      body: Center( 
        child: Column(
          children: [
            Text("Select the Number ${eng_num}"),
            GestureDetector(
              onTap: () {
                if (MyNum[0] == eng_num) {
                  setState(() {
                    score += 1;
                  });
                } else {
                  final snackBar = SnackBar(content: Text("Incorrect"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Image(
                image: AssetImage("image/${MyNum[0]}.png"),
                width: 150,
                height: 150,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (MyNum[1] == eng_num) {
                  setState(() {
                    score += 1;
                  });
                }
              },
              child: Image(
                image: AssetImage("image/${MyNum[1]}.png"),
                width: 150,
                height: 150,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (MyNum[2] == eng_num) {
                  setState(() {
                    score += 1;
                  });
                }
              },
              child: Image(
                image: AssetImage("image/${MyNum[2]}.png"),
                width: 150,
                height: 150,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    GetRandom();
                  });
                },
                child: const Text("Refresh")),
            Text("Score: ${score} "),
          ],
        ),
      ),
    );
  }
}