import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'SVARA', debugShowCheckedModeBanner: false, home: LoginPage()));

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController(), passCtrl = TextEditingController();
  InputDecoration _input(String hint) => InputDecoration(filled: true, fillColor: Colors.white, hintText: hint, border: OutlineInputBorder());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("SVARA", style: TextStyle(fontSize: 40, color: Colors.white)),
              SizedBox(height: 20),
              TextField(controller: emailCtrl, decoration: _input("Email")),
              SizedBox(height: 10),
              TextField(controller: passCtrl, decoration: _input("Password"), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage())), child: Text("Login"))
            ]),
          ),
        ),
      );
}

class HomePage extends StatefulWidget {
  @override State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSettings = false;
  final moods = [["😊", Colors.amber[100]], ["😢", Colors.blue[100]], ["❤️", Colors.pink[100]], ["⚡", Colors.orange[100]], ["🌿", Colors.green[100]], ["📻", Colors.purple[100]], ["😎", Colors.blue[200]], ["😴", Colors.grey[300]]];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("SVARA"), actions: [IconButton(icon: Icon(Icons.settings), onPressed: () => setState(() => showSettings = !showSettings))]),
        body: Column(children: [
          if (showSettings)
            Container(
              color: Colors.white12,
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Text("Username: John Doe", style: TextStyle(color: Colors.white)),
                Text("Email: johndoe@example.com", style: TextStyle(color: Colors.white)),
                ElevatedButton(onPressed: () {}, child: Text("Logout")),
                ElevatedButton(onPressed: () {}, child: Text("Delete Account")),
              ]),
            ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: moods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (c, i) => ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: moods[i][1], shape: CircleBorder(), padding: EdgeInsets.all(10)),
                child: Text(moods[i][0], style: TextStyle(fontSize: 24)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MusicPage())),
              ),
            ),
          )
        ]),
      );
}

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("Mood Playlist"), actions: [IconButton(icon: Icon(Icons.add), onPressed: () {}), IconButton(icon: Icon(Icons.delete), onPressed: () {})]),
        body: Center(child: Text("No music added yet.", style: TextStyle(color: Colors.white))),
      );
}
