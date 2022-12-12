// ignore_for_file: depend_on_referenced_packages, unused_local_variable, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class QuestionPage extends StatefulWidget {
  int pk = 0;

  QuestionPage(this.pk, {Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
      return Color(int.parse("0x$hexColor"));
    } else {
      return Color(int.parse("0x$hexColor"));
    }
  }

  Future<List<dynamic>> fetchQuestion(int pk) async {
    var url = Uri.parse(
        'https://fooodybuddy.up.railway.app/mini-quiz/get-quiz-model/${widget.pk}');

    final response = await http.get(url);
    var data = jsonDecode(response.body);

    return data;
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          "Question List",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: getColorFromHex("#344767"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return FutureBuilder(
        future: fetchQuestion(widget.pk),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var data = snapshot.data ?? [];
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(32, 15, 32, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Text(data[index]['question']),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              OutlinedButton(
                                onPressed: () async {
                                  final response = await http.get(
                                    Uri.parse(
                                        'https://fooodybuddy.up.railway.app/mini-quiz/get-quiz-model/${widget.pk}/${data[index]["pk"]}'),
                                  );
                                },
                                style: const ButtonStyle(
                                  visualDensity: VisualDensity(
                                      vertical: -3, horizontal: -4),
                                ),
                                child: const Text(
                                  'Button sesuatu',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
            );
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Food Waste Awareness Mini Quiz',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            )),
        elevation: 5.0,
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(),
            _buildContent(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
