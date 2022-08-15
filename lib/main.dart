import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count >= 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_3.png"),
              fit: BoxFit.cover,
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Text(
        isFull ? "Lotado" : "Pode entrar!",

            style:isFull
                ? TextStyle(fontSize: 60, color: Colors.red)
                : TextStyle(fontSize: 60, color: Colors.white),
      ),
      Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          count.toString(),
          style: isFull
              ? TextStyle(fontSize: 60, color: Colors.red)
              : TextStyle(fontSize: 60, color: Colors.white),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: isEmpty
                    ? Colors.white.withOpacity(0.2)
                    : Colors.white,
                fixedSize: const Size(150, 70),
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(18))),
            onPressed: isEmpty ? null : decrement,
            child: Text("SAIU",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                )),
          ),
          const SizedBox(width: 25),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: isFull
                      ? Colors.white.withOpacity(0.2)
                      : Colors.white,
                  fixedSize: const Size(150, 70),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 10,
                      ),
                      borderRadius: BorderRadius.circular(18))),
              onPressed: isFull ? null : increment,
              child: const Text("ENTROU",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ))),
        ],
      )
      ],
    ),)
    );
  }
}
