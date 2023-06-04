import 'package:first_day/control/user_control.dart';
import 'package:first_day/model/user_model.dart';
import 'package:first_day/view/UserData/user_data.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel> users = [];
  bool isLoad = true;
  getAllUsers() async {
    users = await UserService.userData();
    if(users != []){
      isLoad = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text(
          'Users',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: isLoad?const Center(child: CircularProgressIndicator()):Column(
          children: <Widget>[
            ListView.separated(
              itemBuilder: (content, index) {
                return user(users[index], context: context);
              },
              separatorBuilder: (content, index) {
                return separator();
              },
              itemCount: users.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

Widget user(UserModel user, {required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserData(
            user: user,
          )));
    },
    focusColor: Colors.white,
    hoverColor: Colors.white,
    highlightColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.teal,
            child: Text('${user.id}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.username,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(user.phone),
            ],
          )
        ],
      ),
    ),
  );
}

Widget separator() {
  return Container(
    width: double.infinity,
    height: 2,
    color: Colors.black,
  );
}
