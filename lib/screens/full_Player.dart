import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';

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

  // ✅ STREAM SUBSCRIPTIONS (to avoid memory leak)
  late StreamSubscription _durationSub;
  late StreamSubscription _positionSub;
  late StreamSubscription _completeSub;

  @override
  void initState() {
    super.initState();

    isPlaying = widget.isPlaying;

    // ----------------------------
    // SAFE STREAM LISTENERS
    // ----------------------------

    _durationSub = widget.player.onDurationChanged.listen((d) {
      if (!mounted) return; // prevents setState after dispose
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

  // ----------------------------
  // PLAY / PAUSE TOGGLE
  // ----------------------------
  Future<void> togglePlay() async {
    if (isPlaying) {
      await widget.player.pause();
      if (!mounted) return;
      setState(() => isPlaying = false);
    } else {
      await widget.player.play(UrlSource(widget.music.audioURL));
      if (!mounted) return;
      setState(() => isPlaying = true);
    }
  }

  String format(Duration d) {
    return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  // ----------------------------
  // DISPOSE — IMPORTANT
  // ----------------------------
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Music Image
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

          // Slider
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

          // Time Labels
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(format(position),
                    style: TextStyle(color: Colors.white)),
                Text(format(total),
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          SizedBox(height: 40),

          // Play / Pause Button
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