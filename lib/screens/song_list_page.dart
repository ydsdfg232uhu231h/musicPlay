import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';
import 'package:musicapp/services/music_operations.dart';

class SongListPage extends StatelessWidget {
  final String category;
  final Function miniPlayer;

  const SongListPage({
    super.key,
    required this.category,
    required this.miniPlayer,
  });

  @override
  Widget build(BuildContext context) {
    List<Musicc> songs = MusicOperations.getMusic();

    return Scaffold(
      appBar: AppBar(title: Text("$category Songs")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            leading: Image.network(song.image),
            title: Text(song.name),
            subtitle: Text(song.desc),
            onTap: () {
              miniPlayer(song, stop: true); // 🔥 plays selected song
            },
          );
        },
      ),
    );
  }
}