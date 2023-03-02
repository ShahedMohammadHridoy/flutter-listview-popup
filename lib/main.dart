import 'package:flutter/material.dart';
import 'Model/football_players.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<footballPlayer> listFootballPlayers = [];

  void addPlayers() {
    setState(() {
      listFootballPlayers.add(footballPlayer(
          name: 'Lionel Messi', club: 'Paris Saint German', age: 33));
      listFootballPlayers.add(footballPlayer(
          name: 'Neymar Jr', club: 'Paris Saint German', age: 29));
      listFootballPlayers.add(
          footballPlayer(name: 'Cristiano Ronaldo', club: 'Juventus', age: 36));
      listFootballPlayers
          .add(footballPlayer(name: 'Abu Trika', club: 'El-Ahly', age: 40));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: listFootballPlayers.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Text(
                      listFootballPlayers[index].name,
                      style: const TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      right: 0,
                      child: PopupMenuButton(
                        onSelected: (value) {},
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Row(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(Icons.edit),
                                ),
                                Text('data')
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Row(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(Icons.share),
                                ),
                                Text('Share')
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Row(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(Icons.delete),
                                ),
                                Text('Delete')
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
