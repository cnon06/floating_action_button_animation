import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {


  late AnimationController animation_cont;
  late Animation<double> scaleAnimation;
  late Animation<double> rotateAnimation;
  bool fw_rw = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation_cont = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(animation_cont)..addListener(() {
      setState(() {

      });
    });

    rotateAnimation = Tween(begin: 0.0, end: pi).animate(animation_cont)..addListener(() {
      setState(() {

      });
    });

    //animation_cont.forward();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Transform.scale(
          scale: scaleAnimation.value,
          child: FloatingActionButton(
            onPressed: ()
            {

            },
            tooltip: 'Fab1',
            backgroundColor: Colors.yellow,
            child: const Icon(Icons.alarm),
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.rotate(
              angle: rotateAnimation.value ,
              child: FloatingActionButton(
                onPressed: ()
                {

                },
                tooltip: 'Fab2',
                backgroundColor: Colors.orange,
                child: const Icon(Icons.photo_camera),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: ()
            {

             if(!fw_rw)
               {
                 animation_cont.forward();
                fw_rw=true;
               }
             else
             {
               animation_cont.reverse();
               fw_rw=false;
             }

            },
            tooltip: 'Fab3',
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
