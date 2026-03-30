import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";
import "package:musicapp/models/music.dart";
import "package:musicapp/screens/full_Player.dart";
import "package:musicapp/screens/home.dart";
import "package:musicapp/screens/yourlibrary.dart";

class MyApp extends StatefulWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late List<Widget> tabs;

  int currentTabIndex = 0;
  bool isPlaying = false;
  Musicc? music;
  Widget miniPlayer(Musicc? music, {bool stop = false}) {
    this.music = music;
    setState(() {});

    if (music == null) return SizedBox();

    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FullPlayer(
              music: music,
              player: _audioPlayer,
              isPlaying: isPlaying,
            ),
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 60,
        width: size.width,
        color: Colors.blueGrey,
        child: Row(
          children: [
            Image.network(
              music.image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Text(
                music.name,
                style: TextStyle(color: Colors.white, fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;

                if (isPlaying) {
                  await _audioPlayer.play(UrlSource(music.audioURL));
                } else {
                  await _audioPlayer.pause();
                }
                setState(() {});
              },
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      Home(miniPlayer),
      const YourLibrary(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: tabs[currentTabIndex],

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // ✔ miniPlayer is now a WIDGET
          miniPlayer(music),

          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (index) {
              setState(() => currentTabIndex = index);
            },
            backgroundColor: Colors.black45,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home, color: Colors.white)),
              BottomNavigationBarItem(
                  label: "Your Library",
                  icon: Icon(Icons.library_books, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
