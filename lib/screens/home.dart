import 'package:flutter/material.dart';
import 'package:musicapp/models/music.dart';
import 'package:musicapp/services/music_operations.dart';
import 'package:musicapp/services/category_operations.dart';
import "package:musicapp/models/category.dart";

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);
  // const Home({Key? key}) : super(key: key);
  Widget creatwCategory(Category category){
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imageURL,fit: BoxFit.cover,width: 93,),
         Padding(
           padding: EdgeInsets.only(left: 10),
             child: Text(category.name,
                 style: TextStyle(
                     color: Colors.white
                 ),
             ),
         ),
        ],

      ),
    );
  }
   List<Widget> createListOfCategories(){
    List<Category> categoryList = CategoryOperations.getCategories();
    List<Widget> categories =  categoryList.map((Category category)=>creatwCategory(category)).toList();
    return categories;
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
             onTap: (){
              _miniPlayer(music, stop: true);
         },
         child: Image.network(
           music.image,
           fit: BoxFit.cover,
         )),
       ),
        Text(music.name,style: TextStyle(color: Colors.white),),
        Text(music.desc, style: TextStyle(color: Colors.white),)
      ],
    ));
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
          children: createListOfCategories(),
          crossAxisCount: 2,
        )
    );
  }

  PreferredSizeWidget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message,style: TextStyle(color: Colors.white),),
      actions: const [
        Padding(padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.settings, color: Colors.white,),
        )

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