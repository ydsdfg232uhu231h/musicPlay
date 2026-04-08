import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';
import 'package:musicapp/server/downloader.dart';
import 'package:path_provider/path_provider.dart';

class FullPlayer extends StatefulWidget {
  final Musicc music;
  final AudioPlayer player;
  final bool isPlaying;

  const FullPlayer({
    super.key,
    required this.music,
    required this.player,
    required this.isPlaying,
  });

  @override
  State<FullPlayer> createState() => _FullPlayerState();
}

class _FullPlayerState extends State<FullPlayer> {
  bool isPlaying = false;
  Duration total = Duration.zero;
  Duration position = Duration.zero;

  late StreamSubscription _durationSub;
  late StreamSubscription _positionSub;
  late StreamSubscription _completeSub;

  @override
  void initState() {
    super.initState();

    isPlaying = widget.isPlaying;

    _durationSub = widget.player.onDurationChanged.listen((d) {
      if (!mounted) return;
      setState(() => total = d);
    });

    _positionSub = widget.player.onPositionChanged.listen((p) {
      if (!mounted) return;
      setState(() => position = p);
    });

    _completeSub = widget.player.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });
  }

  // -------------------------------------
  // PLAY / PAUSE + LOCAL FILE CHECK
  // -------------------------------------
  Future<void> togglePlay() async {
    if (isPlaying) {
      await widget.player.pause();
      if (!mounted) return;
      setState(() => isPlaying = false);
    } else {
      String fileName =
          widget.music.name.replaceAll(" ", "_") + ".m4a";

      Directory dir = await getApplicationDocumentsDirectory();
      String path = "${dir.path}/$fileName";

      File localFile = File(path);

      if (localFile.existsSync()) {
        await widget.player.play(DeviceFileSource(path));
      } else {
        await widget.player.play(UrlSource(widget.music.audioURL));
      }

      if (!mounted) return;
      setState(() => isPlaying = true);
    }
  }

  String format(Duration d) {
    return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _durationSub.cancel();
    _positionSub.cancel();
    _completeSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.music.name),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () async {
              String? path = await Downloader.downloadSong(
                widget.music.audioURL,
                widget.music.name.replaceAll(" ", "_"),
              );

              if (path != null && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Downloaded to $path")),
                );
              }
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 280,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(widget.music.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 40),

          Slider(
            min: 0,
            max: total.inSeconds == 0 ? 1 : total.inSeconds.toDouble(),
            value: position.inSeconds
                .toDouble()
                .clamp(0, total.inSeconds.toDouble()),
            onChanged: (value) {
              widget.player.seek(Duration(seconds: value.toInt()));
            },
            activeColor: Colors.white,
            inactiveColor: Colors.white30,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(format(position), style: TextStyle(color: Colors.white)),
                Text(format(total), style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          SizedBox(height: 40),

          IconButton(
            iconSize: 90,
            color: Colors.white,
            icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
            onPressed: togglePlay,
          )
        ],
      ),
    );
  }
}