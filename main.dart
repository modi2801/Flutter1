import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

main(){
  runApp(app());
}

class app extends StatelessWidget {
  @override
  build (BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

var myaccicon = Icon(Icons.account_circle);
  var myaccbutton = IconButton(icon: myaccicon, onPressed: null);
  var mymusicicon = Icon(Icons.audiotrack);
  var mymusiciconbutton = IconButton(icon: mymusicicon, onPressed: null);
  var downloadicon = Icon(Icons.file_download);
  var mydownloadiconbutton = IconButton(icon: downloadicon, onPressed: null);
  var myleadingicon = Image.network("https://github.com/modi2801/Flutter1/blob/master/sp.jpg?raw=true");

class _homeState extends State<home> {
  AudioPlayer _audio = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Creating AppBar
      appBar: AppBar(
      title: Text(
      'SongPad',
      style: GoogleFonts.mcLaren(
      textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)
      ),
      ),
      backgroundColor: Colors.orange.shade400,
      leading: myleadingicon,
      actions: <Widget>[
      mymusiciconbutton,
      mydownloadiconbutton,
      myaccbutton,
      ],
    ),
    

    //Creating Body

    body: Container(
    color: Colors.black,
    child: Column(children: <Widget>[
      Container(
        child: Column(children: <Widget>[
          Text(
            'Romantic',
             style: TextStyle(
               fontSize: 26,
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontFamily: 'Raleway',
               backgroundColor: Colors.orange.shade400,

          ),),

              Container(
                child: RaisedButton(
                  onPressed: () 
                    async{
                      int status = await _audio.play('https://github.com/modi2801/Flutter1/blob/master/r1.mp3?raw=true');
                       if(status == 1){
                       setState(() {
                       isPlaying = true;
                      });
                     }
                   },
                  
                  child: Card(
                  child: Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage ('https://github.com/modi2801/Flutter1/blob/master/romantic.jpg?raw=true'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3.0, color: Colors.white),
            ),
             width: double.infinity,
             height: 150,

          ),),),),
          
      ],),
      ),
      Container(
        child: Column(children: <Widget>[
          Text(
            'WorkOut',
             style: TextStyle(
               fontSize: 26,
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontFamily: 'RobotoMono',
               backgroundColor: Colors.orange.shade400,

          ),),
          Container(
            child: RaisedButton(
                  onPressed: () 
                    async{
                      int status = await _audio.play('https://github.com/modi2801/Flutter1/blob/master/w1.mp3?raw=true');
                       if(status == 1){
                       setState(() {
                       isPlaying = true;
                      });
                     }
                   },
                  
                  child: Card(
                  child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage ('https://raw.githubusercontent.com/modi2801/Flutter1/master/workout.jpeg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3.0, color: Colors.white),

            ),
             width: double.infinity,
             height: 160,
             //margin: EdgeInsets.all(5),
          ),),),),
          
      ],),
      ),
      
      Container(
        child: Column(children: <Widget>[
          Text(
            'Party',
             style: TextStyle(
               fontSize: 26,
               color: Colors.black,
               fontWeight: FontWeight.bold,
               backgroundColor: Colors.orange.shade400,

          ),),
          Container(
            child: RaisedButton(
                  onPressed: () 

                    async{
                      int status = await _audio.play('https://github.com/modi2801/Flutter1/blob/master/p1.mp3?raw=true');
                       if(status == 1){
                       setState(() {
                       isPlaying = true;
                      });
                     }
                   },
                  
                  child: Card(
                  child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage ('https://raw.githubusercontent.com/modi2801/Flutter1/master/party.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3.0, color: Colors.white),
            ),
             width: double.infinity,
             height: 170,
             //margin: EdgeInsets.all(5),
          ),),),),
          
      ],),
      ),

      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        color: Colors.orange.shade300,
        height: 100,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
           IconButton(
                  icon: Icon(Icons.stop, color: Colors.black, size: 60,),
                  onPressed: (){
                    _audio.stop();

                    setState(() {
                      isPlaying = false;
                    });

                  },
                ),

          IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color:Colors.black, size: 60,),
                  onPressed: (){
                    if(isPlaying){
                      _audio.pause();

                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      _audio.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                )  ,
                ],),
      ),
    ],),
  ),
           );
}
}
