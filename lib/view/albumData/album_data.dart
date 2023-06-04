import 'package:first_day/control/user_control.dart';
import 'package:first_day/model/album_model.dart';
import 'package:first_day/model/user_model.dart';
import 'package:flutter/material.dart';

class AlbumData extends StatefulWidget {
  const AlbumData({Key? key, required this.album}) : super(key: key);
  final AlbumModel album;

  @override
  State<AlbumData> createState() => _AlbumDataState();
}

class _AlbumDataState extends State<AlbumData> {
  UserModel? user;
  bool isLoad = true;

  getUserById() async {
    user = await UserService.getOneUserById(widget.album.userId);
    if (user != null) {
      isLoad = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print(widget.album.title);
    getUserById();
  }

  @override
  Widget build(BuildContext context) {
    AlbumModel album = widget.album;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(
          album.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: isLoad
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  customText("Id", '${album.id}'),
                  customText("User Id", '${album.userId}'),
                  customText("Title", album.title),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                      child: Text(
                    "User",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
                  customText("User ID", '${user!.id}'),
                  customText("Name", user!.name),
                  customText("User Name", user!.username),
                  customText("Email", user!.email),
                ],
              ),
            ),
    );
  }
}

Widget customText(String lead, String text) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Text(
      '$lead: $text',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
  );
}
