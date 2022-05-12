import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.red;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // 웹에서 마우스 포인터와 관련해서 이벤트를 처리하는 위젯?
        child: Listener(
          // 마우스 포인터가 해당 위젯 위로 올라왔을때 or 올라오지 않았을 때 사용
          onPointerDown: (_) => setState(() {
            isPressed = true;
          }),
          onPointerUp: (_) => setState(() {
            isPressed = false;
          }),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                for (double i = 1; i < 5; i++)
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: (isPressed ? 5 : 3) * i,
                    inset: true,
                  ),
                for (double i = 1; i < 5; i++)
                  BoxShadow(
                    spreadRadius: -1,
                    color: shadowColor,
                    blurRadius: (isPressed ? 5 : 3) * i,
                    blurStyle: BlurStyle.outer,
                  ),
              ],
            ),
            child: TextButton(
              //onHover => 마우스포인터가 위젯의 위를 지나가는 상황에서의 이벤트
              onHover: (hovered) => setState(() {
                isPressed = hovered;
              }),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.white, width: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Neon Button',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  shadows: [
                    // Shadow(color: shadowColor, blurRadius: 3),
                    // Shadow(color: shadowColor, blurRadius: 6),
                    // Shadow(color: shadowColor, blurRadius: 9),
                    for (double i = 1; i < (isPressed ? 8 : 4); i++)
                      Shadow(color: shadowColor, blurRadius: i * 3)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
