import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learn/Signup.dart';
import 'package:learn/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mobile = "dhhd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(80.0))),
              elevation: 5,
              child: Image.asset('assets/images/logo.png',
                  width: 150.0, height: 150.0),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10.0),
          //   child: Card(
          //     shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(80.0))),
          //     elevation: 5,
          //     child: SvgPicture.asset('assets/images/dummy.svg',width: 100,height: 100,),
          // )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            alignment: Alignment.topLeft,
            child: RichText(
              text: const TextSpan(
                  text: "Login In",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: "\nIf you are already registered, log in here",
                        style: TextStyle(
                            fontFamily: "Nexa",
                            color: Colors.black,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal))
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black87),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Please enter mobile number",
              ),
              onChanged: (value) {
                mobile = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Signup()));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homeScreen()));
                },
                child: const Text("Login"),
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: RichText(
              text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                        text: "Create Account",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup())),
                        style: TextStyle(
                            decoration: TextDecoration.combine(
                                [TextDecoration.underline]),
                            fontFamily: 'Roboto',
                            color: Colors.blue,
                            fontWeight: FontWeight.normal))
                  ]),
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
