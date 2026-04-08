import 'dart:io';
import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';
import 'package:path_provider/path_provider.dart';

class YourLibrary extends StatefulWidget {
  final Function(Musicc music, {bool stop}) miniPlayer;

  const YourLibrary(this.miniPlayer, {super.key});

  @override
  State<YourLibrary> createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  List<Musicc> savedSongs = [];

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    List<Musicc> defaultSongs = [
      Musicc(
        "Maan Meri Jaan",
        "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/a1/54/be/a154be36-2ba3-a22a-4064-c3d78f910c11/5054197602184.jpg/100x100bb.jpg",
        "Afterlife song",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/08/88/dc/0888dc54-64eb-d0c5-f33a-4a0522fdc07c/mzaf_529871923278566290.plus.aac.p.m4a",
      ),
      Musicc(
        "Lag Ja Gale",
        "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/4f/59/b4/4f59b41c-6997-9861-2a3d-8c77e7183306/191773223571.jpg/100x100bb.jpg",
        "Lag Ja Gale Se Phir",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/59/24/d2/5924d2b1-84a4-2dd7-c32a-96904262c12d/mzaf_3821363553021129074.plus.aac.p.m4a",
      ),
      Musicc(
        "Pyar Hua Ikraar Hua",
        "https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/bb/1f/da/bb1fda1a-c23a-362b-cdb1-41da16a19214/193483910604.jpg/100x100bb.jpg",
        "Romantic Classic",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/77/ae/fb/77aefb38-7612-d436-35f8-0a74b016630f/mzaf_11920461595213812573.plus.aac.p.m4a",
      ),
      Musicc(
        "Awaara Hoon",
        "https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/58/d4/71/58d4714a-1bd6-6c33-d971-a69ac1ec79b7/191773343514.jpg/100x100bb.jpg",
        "Classic Evergreen Song",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/61/7a/7b/617a7b19-78e7-c60f-d69e-967d6a472beb/mzaf_12443654160676915976.plus.aac.p.m4a",
      ),
    ];

    // Add default songs first
    savedSongs = [...defaultSongs];

    // Load downloaded songs
    Directory dir = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = dir.listSync();

    for (var file in files) {
      if (file.path.endsWith(".m4a")) {
        String name = file.path
            .split("/")
            .last
            .replaceAll(".m4a", "")
            .replaceAll("_", " ");

        savedSongs.add(
          Musicc(
            name,
            "https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/58/d4/71/58d4714a-1bd6-6c33-d971-a69ac1ec79b7/191773343514.jpg/100x100bb.jpg",
            "Downloaded Song",
            file.path, // local file path
          ),
        );
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Your Library",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: savedSongs.isEmpty
          ? const Center(
        child: Text(
          "No songs in your library",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: savedSongs.length,
        itemBuilder: (context, index) {
          final song = savedSongs[index];

          return ListTile(
            leading: Image.network(song.image, width: 50, height: 50),
            title: Text(song.name,
                style: const TextStyle(color: Colors.white)),
            subtitle: Text(song.desc,
                style: const TextStyle(color: Colors.white70)),
            onTap: () {
              widget.miniPlayer(song, stop: true);
            },
          );
        },
      ),
    );
  }
}