import 'package:flutter/material.dart';
import 'package:tips/models/tips_model.dart';
import 'package:tips/screens/detail_tips_page.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });

  final MyArticle article;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network(
              article.fields.image,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: Colors.red.withOpacity(0.4),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    article.fields.title,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    article.fields.content,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return DetailTipsPage(model: article);
                      }));
                    },
                    child: const Text(
                      "Baca selengkapnya",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardBannerLoggedIn extends StatelessWidget {
  const CardBannerLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          "Kamu bisa menambahkan artikel di sini, Buddy. Konten yang akan kamu unggah dapat berupa tips pengelolaan sisa makanan, cara mengurangi food waste, atau hal lainnya yang berkaitan erat dengan food waste.",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class CardBannerNotLoggedIn extends StatelessWidget {
  const CardBannerNotLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          "Ups, kamu belum login. Login dulu untuk membuat artikel! Untuk sementara, kamu bisa melihat artikel orang lain dulu.",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
