import 'package:flutter/material.dart';
import 'package:riverpodproject/model/service.dart';
import 'package:riverpodproject/model/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> _user = <User>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Services.getInfo().then(
      (value) {
        setState(
          () {
            _user = value;
            loading = true;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'User' : 'loading...'),
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, index) {
          User user = _user[index];
          return ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              color: Colors.grey,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.smartphone_rounded,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          user.name,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              user.phone,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            title: Text(user.name),
            subtitle: Text(
              user.email,
            ),
          );
        },
      ),
    );
  }
}
