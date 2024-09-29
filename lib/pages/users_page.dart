import 'package:chat/Models/users.dart';
import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/profile_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  ColorsTheme colorTheme = ColorsTheme();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  List<User> users = [
    User(uid: "1", name: "Fernando", email: "ferlopezmr22@gmail.com", online: true),
    User(uid: "2", name: "Maria", email: "maria22@gmail.com", online: false),
    User(uid: "3", name: "Daniela", email: "daniela22@gmail.com", online: true)
  ];
  
  void _getUsers() async{ 
    await Future.delayed(const Duration(seconds: 1)); 
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "usuarios",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 1,
          backgroundColor: colorTheme.primaryColor,
          leading:const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
      body: listUsers(),
    );
  }

  Widget listUsers() {
    return SmartRefresher(
      onRefresh: ()=> _getUsers(), 
      enablePullDown: true,
      controller: _refreshController,
      child: ListView.separated(
        physics:const BouncingScrollPhysics(),
        itemBuilder: (context, index) => listTileUser(users[index]),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: users.length,
      ),
    );
  }

  ListTile listTileUser(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: UserCircleAvatar(username: user.name.substring(0, 2)),
      trailing: Icon(Icons.circle, color: user.online? Colors.green:Colors.red, size: 15,),
    );
  }
}
