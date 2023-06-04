import 'package:first_day/control/album_control.dart';
import 'package:first_day/model/album_model.dart';
import 'package:first_day/view/albumData/album_data.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  List<AlbumModel> albums = [];
  bool isLoad = true;

  getAllAlbums() async {
    albums = await AlbumService.albumsData();
    if (albums != []) {
      // print(albums);
      isLoad = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text(
          'Albums',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: isLoad
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (content, index) {
                  return album(albums[index], context: context);
                },
                itemCount: albums.length,
              ),
      ),
    );
  }
}

Widget album(AlbumModel album, {required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AlbumData(
                album: album,
              )));
    },
    focusColor: Colors.white,
    hoverColor: Colors.white,
    highlightColor: Colors.white,
    child: Container(
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
    ),
  );
}
