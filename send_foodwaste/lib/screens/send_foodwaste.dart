import 'package:flutter/material.dart';
import 'package:fooody/common/cookie_request.dart';
import 'package:fooody/screens/login.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:send_foodwaste/util/fetch_foodwaste.dart';
import 'package:send_foodwaste/screens/add_foodwaste.dart';
import 'package:intl/intl.dart';

class SendFoodHomePage extends StatefulWidget {
  const SendFoodHomePage({super.key});

  @override
  State<SendFoodHomePage> createState() => _SendFoodHomePageState();
}

class _SendFoodHomePageState extends State<SendFoodHomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Send Food Waste",
        ),
      ),
      drawer: const AppDrawer(),
      body: request.loggedIn
          ? (FutureBuilder(
              future: fetchFoodWaste(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data.length == 0) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "You have no foodwaste",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddFoodHomePage()),
                            );
                          },
                          child: const Text(
                            "Add a foodwaste",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
                          ),
                        )
                      ],
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFEA150),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.black, blurRadius: 2.0)
                            ]),
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${snapshot.data![index].fields.address}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${snapshot.data![index].fields.phoneNumber}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Expires on ${DateFormat('yyyy-MM-dd').format(snapshot
                                          .data![index].fields.expiryDate)}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${snapshot.data![index].fields.foodType}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${snapshot.data![index].fields.weight} grams",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
              }))
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "You are not logged in",
                    style: TextStyle(fontSize: 27),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Go to login page",
                      style: TextStyle(fontSize: 17),
                    ))
              ],
            )),
      floatingActionButton: Stack(
        children: [
          if (request.loggedIn) ...[
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddFoodHomePage()),
                  );
                },
                tooltip: "Send a foodwaste",
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
