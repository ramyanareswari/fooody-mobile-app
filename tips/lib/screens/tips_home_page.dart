// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:tips/common/fetch_tips.dart';
import 'package:tips/models/tips_model.dart';
import 'package:tips/widgets/widget.dart';

class TipsHomePage extends StatefulWidget {
  const TipsHomePage({Key? key}) : super(key: key);
  static const routeName = '/tips-home-page';

  @override
  State<TipsHomePage> createState() => _Tips_HomePageState();
}

class _Tips_HomePageState extends State<TipsHomePage> {
  List<MyArticle> list = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getArticleData();
  }

  getArticleData() {
    debugPrint("Halooo");
    setLoading(true);
    setState(() {
      list.clear();
    });
    fetchWatchList().then((value) {
      setState(() {
        list.addAll(value);
      });
    }).whenComplete(() {
      setLoading(false);
    });
  }

  setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foody Article Home Page"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    getArticleData();
                  },
                  child: const Icon(
                    Icons.refresh,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Builder(builder: (context) {
        if (isLoading && list.isEmpty) {
          return const Center(
            child: Text("Memuat..."),
          );
        }

        if (!isLoading && list.isEmpty) {
          return Center(
            child: InkWell(
              onTap: () {
                getArticleData();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Datanya kosong. Coba ketuk tulisan ini untuk memuat ulang"),
              ),
            ),
          );
        }
        return _buildListView();
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFEA150),
        onPressed: () {
          
        },
        tooltip: 'Tambahkan Artikel!',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const CardBannerNotLoggedIn(),
        const CardBannerLoggedIn(),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            padding: EdgeInsets.fromLTRB(
                5, 15, 5, MediaQuery.of(context).size.height * 0.05),
            itemBuilder: (ctx, index) {
              return ArticleItem(article: list[index]);
            }),
      ],
    );
  }
}
