import 'package:flutter/material.dart';

// Music model
class Musicc {
  final String name;
  final String desc;
  final String image;
  final String desc;
  final String audioUrl;

  const Musicc(this.name, this.image, this.desc, this.audioUrl);
}

// YourLibrary page
class YourLibrary extends StatelessWidget {
  YourLibrary({Key? key}) : super(key: key);

  const YourLibrary({Key? key, required this.onMusicSelect}) : super(key: key);

  static const List<Musicc> musics = [
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
      "Classic romantic",
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/77/ae/fb/77aefb38-7612-d436-35f8-0a74b016630f/mzaf_11920461595213812573.plus.aac.p.m4a",
    ),
    Musicc(
      "Awaara Hoon",
      "https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/58/d4/71/58d4714a-1bd6-6c33-d971-a69ac1ec79b7/191773343514.jpg/100x100bb.jpg",
      "Evergreen classic",
      "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/61/7a/7b/617a7b19-78e7-c60f-d69e-967d6a472beb/mzaf_12443654160676915976.plus.aac.p.m4a",
    ),
    Musicc(
      name: "Song 2",
      desc: "Artist 2",
      image: "https://via.placeholder.com/200",
    ),
    Musicc(
      name: "Song 3",
      desc: "Artist 3",
      image: "https://via.placeholder.com/200",
    ),
  ];

  // Music card widget
  Widget createMusic(Musicc music, Function(Musicc) onTap) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => onTap(music),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(music.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              music.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              music.desc,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  // Mini player logic (demo)
  void _miniPlayer(Musicc music, {bool stop = false}) {
    print("Playing ${music.name} | stop: $stop");
  }

  @override
  Widget build(BuildContext context) {
    // Example fake list — replace with your real saved music list
    static const List<Musicc> musics = [
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

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Your Library"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: musics.map((music) {
            return createMusic(music, (m) => _miniPlayer(m, stop: true));
          }).toList(),
        ),
      ),
    );
  }
}