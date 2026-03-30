  import 'package:flutter/material.dart';
  import 'package:musicapp/models/music.dart';
import 'package:musicapp/screens/login_page.dart';
  import 'package:musicapp/screens/song_list_page.dart';
  import 'package:musicapp/services/music_operations.dart';
  import 'package:musicapp/services/category_operations.dart';
  import "package:musicapp/models/category.dart";

  class Home extends StatelessWidget {
    Function _miniPlayer;
    Home(this._miniPlayer);
    // const Home({Key? key}) : super(key: key);
    Widget creatwCategory(Category category, BuildContext context) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SongListPage(category: category.name),
            ),
          );
        },
        child: Container(
          color: Colors.blueGrey.shade400,
          child: Row(
            children: [
              Image.network(
                category.imageURL,
                fit: BoxFit.cover,
                width: 70,
                height: 65,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  category.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }

    List<Widget> createListOfCategories(BuildContext context) {
      List<Category> categoryList = CategoryOperations.getCategories();
      return categoryList
          .map((category) => createCategory(category, context))
          .toList();
    }

    Widget createGrid(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(10),
        height: 280,
        child: GridView.count(
          padding: EdgeInsets.all(5),
          childAspectRatio: 5 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: createListOfCategories(context),
          crossAxisCount: 2,
        ),
      );
    }
    
    Widget createMusic(Musicc music){
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              child: InkWell(
                onTap: () {
                  _miniPlayer(music, stop: true);
                },
                child: Image.network(
                  music.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(music.name, style: TextStyle(color: Colors.white)),
            Text(music.desc, style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    }
    Widget createMusicList(String label){
      List<Musicc> musicList = MusicOperations.getMusic();
      return  Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index){
                        return createMusic(musicList[index]);
                      }, itemCount: musicList.length,
                    )
                )
              ]
          )
      );
    }
    Widget createTopMusicList(String label){
      List<Musicc> musicList = MusicOperations.getTopMusic();
      return  Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index){
                        return createMusic(musicList[index]);
                      }, itemCount: musicList.length,
                    )
                )
              ]
          )
      );
    }

  Widget createGrid(){
    return Container(
      padding: EdgeInsets.all(10),
      height: 280,
       child: GridView.count(
         padding: EdgeInsets.all(5),
         childAspectRatio: 5/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
         children: createListOfCategories(context),
          crossAxisCount: 2,
        )
    );
  }


    PreferredSizeWidget createAppBar(String message, BuildContext context) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(message,style: TextStyle(color: Colors.white),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
              ),
            ),
          ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
     child: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade300,Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1,0.3]
          ),
        ),
       child: Column(
         children: [
           createAppBar("Good Morning"),
           SizedBox(
             height: 5,
           ),
           createGrid(),
           createMusicList("Best song for you"),
           createTopMusicList("All Time Popular song"),
         ],
       ),
      ),
    ));
  }
}