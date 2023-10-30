import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn/model/CommentResponse.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<homeScreen> {
  List<CommentResponse>? items;

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        items = value;
        print(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: items == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: items?.length,
                itemBuilder: (context, index) {
                  return itemWidget((items?[index] ??
                      CommentResponse(
                          postId: 1,
                          id: -1,
                          name: "name",
                          email: "email",
                          body: "body")));
                }),
      ),
    );
  }
}

Widget itemWidget(CommentResponse commentResponse) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    elevation: 5,
    color: Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child: Container(
      padding: EdgeInsets.all(10),
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "id: ${commentResponse.id}",
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.blue,
                margin: const EdgeInsets.only(right: 1),
                child: Text("Name: ${commentResponse.name}"),
              )),
              Expanded(
                  child: Container(
                color: Colors.red,
                margin: EdgeInsets.only(left: 1),
                child: Text("Email: ${commentResponse.email}"),
              ))
            ],
          ),
          Container(
            width: double.infinity,
            color: Colors.amber,
            child: Text(
              "Desc: ${commentResponse.body.trim().replaceAll("\n", "")}",
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    ),
  );
}

Future<List<CommentResponse>?> fetchData() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  if (response.statusCode == 200) {
    return commentResponseFromJson(response.body.toString());
  } else {
    return null;
  }
}
