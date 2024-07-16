import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
     PageController? _pageController;
     int totalPage = 4;
     void _onScroll() {

     }
  @override
   void initState(){
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: SafeArea(
        child: Scaffold(
          body:  PageView(
            controller: _pageController,
            children: [
              makePage(imagePath: 'assets/images/one.jpg', title: 'Yosemite National Park',
                  description: "Yosemite National Park is in California\'s Sierra Nevada mountains. It's famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.", pageNumber: 1),
              makePage(imagePath: 'assets/images/two.jpg', title: 'Golden Gate Bridge', description: 'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.', pageNumber: 2),
              makePage(imagePath: 'assets/images/three.jpg', title: 'Sedona', description: 'Sedona is regularly described as one of America\'s most beautiful places. Nowhere else will you find a landscape as dramatically colorful.', pageNumber: 3),
              makePage(imagePath: 'assets/images/four.jpg', title: 'Savannah', description: 'Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.', pageNumber: 4),
            ],
          ),
        
        
        ),
      ),
    );
  }
Widget makePage({required String imagePath, required String title, required String description, required int pageNumber}) {
      return Container(
        decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [0.3, 0.9],
                colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2)
            ]

            )
          ),
          child:    Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(pageNumber.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    Text('/$totalPage', style: TextStyle(color: Colors.white, fontSize: 15),)
                  ],
                ),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height:20 ,
                    ),
                    Row(
                      children: [
                        Container( child: Icon(Icons.star, color: Colors.yellow, size: 15 ),
                          margin: EdgeInsets.only(right: 5),),
                        Container( child: Icon(Icons.star, color: Colors.yellow, size: 15 ),
                          margin: EdgeInsets.only(right: 5),),
                        Container( child: Icon(Icons.star, color: Colors.yellow, size: 15 ),
                          margin: EdgeInsets.only(right: 5),),
                        Container( child: Icon(Icons.star, color: Colors.yellow, size: 15 ),
                          margin: EdgeInsets.only(right: 5),),
                        Container( child: Icon(Icons.star, color: Colors.yellow, size: 15 ),
                          margin: EdgeInsets.only(right: 5),),
                        Container( child: Icon(Icons.star, color: Colors.grey, size: 15 ),
                          margin: EdgeInsets.only(right: 5),),
                        Text('4.0', style: TextStyle(color: Colors.white70)),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 10),),
                      ],
                    ),
                    const SizedBox(
                      height:20
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15)),
                    ),
                    const SizedBox(
                        height:20
                    ),

                    Text('READ MORE', style: TextStyle(color: Colors.white)),
                    const SizedBox(
                        height:40
                    ),

                  ],
                ))
              ],
            ),
          ),
        ),
      );
}
}


