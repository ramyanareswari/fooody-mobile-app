// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tips/models/tips_model.dart';
import 'package:intl/intl.dart';

class DetailTipsPage extends StatefulWidget {
  const DetailTipsPage({super.key, required this.model});
  static const String routeName = "detail-tips";
  final MyArticle model;

  @override
  State<DetailTipsPage> createState() => _DetailTipsPageState();
}

class _DetailTipsPageState extends State<DetailTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Tips"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(
              widget.model.fields.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          color: Colors.red.withOpacity(0.7),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Gambar rusak atau mungkin URL tidak valid",
                          style: TextStyle(
                            color: Colors.red.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            // title: Text(
            //   "Dibuat oleh Author 1",
            //   style:
            //       TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600),
            // ),
            subtitle: Text(
              DateFormat("dd MMM yyyy")
                  .format(widget.model.fields.publish)
                  .toString(),
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.fields.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.model.fields.content,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
