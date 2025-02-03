import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textField = TextEditingController();
  bool isSearch = false;

  @override
  void dispose() {
    textField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextFormField(
          decoration: InputDecoration(
            labelText: "Search user",
            labelStyle: Theme.of(context).textTheme.labelSmall,
          ),
          onFieldSubmitted: (value) {
            setState(() {
              isSearch = true;
            });
          },
        ),
      ),
      body: isSearch
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('username', isGreaterThanOrEqualTo: textField.text)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data!.docs[index]['photoUrl'],
                        ),
                      ),
                      title: Text(snapshot.data!.docs[index]['username']),
                    );
                  },
                );
              },
            )
          : const Text("Post"),
    );
  }
}
