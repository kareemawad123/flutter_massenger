import 'package:first_day/control/album_control.dart';
import 'package:first_day/model/album_model.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  bool isLoad = true;
  List<AlbumModel> albums = [];
  getUserAlbums()async{
    albums = await AlbumService.albumsDataByUserId(widget.user.id);
    if(albums != []){
      isLoad = false;
      print(albums);
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getUserAlbums();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    UserModel user = widget.user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(
          user.name,
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
            const Center(
                child: Text(
                  "User",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            customText("User ID", '${user.id}'),
            customText("Name", user.name),
            customText("User Name", user.username),
            customText("Email", user.email),
            const SizedBox(height: 15,),
            const Center(
                child: Text(
                  "Albums",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: ListView.builder(itemBuilder: (content, index){
                return album(albums[index],context: context);
              },
                itemCount: albums.length,
              ),
            ),
          ],
        ),
      ),
    );;
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

Widget album(AlbumModel album, {required BuildContext context}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.tealAccent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        album.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    ),
  );
}