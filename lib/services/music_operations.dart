import 'package:musicapp/models/music.dart';

class MusicOperations {
  MusicOperations._();

  // ---------------------------------------------------
  // 🎵   MAIN MUSIC LIST
  // ---------------------------------------------------
  static List<Musicc> getMusic() {



    return <Musicc>[
      Musicc(
        "Toofan",
        "https://m.media-amazon.com/images/M/MV5BNzdlMDUyZGItYTBkYS00OWJjLTkyMjYtZGE0ZDVjYmQ1ZWJjXkEyXkFqcGc@._V1_.jpg",
        "Powerful energetic beat",
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/2e/e2/7d/2ee27d35-5e1e-0fd0-42ea-359b5256403e/mzaf_9335390342361255150.plus.aac.p.m4a'),

      Musicc(
        "Gully Boy",
        "https://m.media-amazon.com/images/S/pv-target-images/6837cb65d1dc471e1524c795465dd3ed340e82c8a19d5a6dac07c3228dd9b447.jpg",
        "Hustle motivation rap",
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/ad/53/bf/ad53bf8c-9bf2-90d7-05d4-ec34186f33ff/mzaf_13379019530104319252.plus.aac.p.m4a',

      ),

      Musicc(
        "Ae Dil Hai Mushkil",
        "https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/ae-dil-hai-mushkil-et00032168-30-08-2016-10-50-16.jpg",
        "Emotional soulful melody",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/09/17/bb/0917bbe1-58c3-6252-d00e-9b70d42ef5dc/mzaf_2269500085377778268.plus.aac.p.m4a",

      ),

      Musicc( "Maan mari jaan",
        "https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/90/9d/aa/909daa9a-3a47-9314-2855-39f5a157f1e3/5054197407734.jpg/100x100bb.jpg",
        "Royal grand melody",
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview221/v4/49/c8/c0/49c8c0eb-6a72-d639-02d2-d55fa0034b89/mzaf_6556689839136809010.plus.aac.p.m4a',
      ),
    ];
  }

  // ---------------------------------------------------
  // 🎧   TOP MUSIC LIST
  // ---------------------------------------------------
  static List<Musicc> getTopMusic() {
    return <Musicc>[
      Musicc(
        "Maan Mari jaan",
        "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/a1/54/be/a154be36-2ba3-a22a-4064-c3d78f910c11/5054197602184.jpg/100x100bb.jpg",
        "Afterlife song",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/08/88/dc/0888dc54-64eb-d0c5-f33a-4a0522fdc07c/mzaf_529871923278566290.plus.aac.p.m4a",

      ),

      Musicc(
        "Lag Ja Gale",
        "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/4f/59/b4/4f59b41c-6997-9861-2a3d-8c77e7183306/191773223571.jpg/100x100bb.jpg",
        "Lag Ja Gale Se Phir song",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/59/24/d2/5924d2b1-84a4-2dd7-c32a-96904262c12d/mzaf_3821363553021129074.plus.aac.p.m4a",


      ),

      Musicc(
        "Pyar Hua Ikraar Hua",
        "https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/bb/1f/da/bb1fda1a-c23a-362b-cdb1-41da16a19214/193483910604.jpg/100x100bb.jpg",
        "Pyar Hua Ikraar Hua song",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/77/ae/fb/77aefb38-7612-d436-35f8-0a74b016630f/mzaf_11920461595213812573.plus.aac.p.m4a",

      ),

      Musicc(
        "Awaara Hoon",
        "https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/58/d4/71/58d4714a-1bd6-6c33-d971-a69ac1ec79b7/191773343514.jpg/100x100bb.jpg",
        "Awaara Hoon song",
        "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/61/7a/7b/617a7b19-78e7-c60f-d69e-967d6a472beb/mzaf_12443654160676915976.plus.aac.p.m4a",

      ),
    ];
  }
}