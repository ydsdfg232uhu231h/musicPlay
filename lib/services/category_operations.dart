import 'package:musicapp/models/category.dart';

class CategoryOperations {
  CategoryOperations._(){}
  static List<Category> getCategories(){
    return <Category>[
      Category('Top Songs', 'https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/0e/09/c4/0e09c462-c0cd-0a6c-d748-ea69b70442b7/source/256x256bb.jpg',),
      Category("MJ Hits", "https://is1-ssl.mzstatic.com/image/thumb/Purple71/v4/d1/ba/85/d1ba8582-972e-7e02-6f3b-cc47adfc055f/source/256x256bb.jpg"),
      Category("Popular", 'https://c.saavncdn.com/109/Popular-Music-Punjabi-2022-20220916133544-500x500.jpg'),
      Category("Clasic Music", "https://www.libertyparkmusic.com/wp-content/uploads/Screen-Shot-2021-02-11-at-1.28.22-PM-1024x827.png"),
      Category("Traditional", "https://images.stockcake.com/public/0/1/1/01197fa1-0878-4ee2-b926-2e50b72698fa_large/traditional-music-performance-stockcake.jpg"),
      Category("Sad song", "https://i1.sndcdn.com/artworks-y0Luzy9CQkb8S1Ss-4qSCaw-t500x500.jpg")
    ];
  }
}