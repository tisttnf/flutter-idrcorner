import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "GRID dan HERO",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperhero = new List();

  var karakter = [
    {"nama": "Satu", "gambar": "satu.png"},
    {"nama": "Dua", "gambar": "dua.png"},
    {"nama": "Tiga", "gambar": "tiga.png"},
    {"nama": "Empat", "gambar": "empat.png"},
    {"nama": "Lima", "gambar": "lima.png"},
    {"nama": "Enam", "gambar": "enam.png"},
    {"nama": "Tujuh", "gambar": "tujuh.png"},
    {"nama": "Delapan", "gambar": "delapan.png"},
    {"nama": "Sembilan", "gambar": "sembilan.png"},
    {"nama": "Sepuluh", "gambar": "sepuluh.png"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarSuperhero.add(new Container(
        // child: new Text(karakternya["nama"]),
        padding: new EdgeInsets.all(10.0),
        child: new Card(
            child: new Column(
          children: <Widget>[
            new Hero(
              tag: karakternya["nama"],
              child: new Material(
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            nama: karakternya['nama'],
                            gambar: gambar,
                          ))),
                  child: new Image.asset(
                    "img/$gambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
            ),
            new Text(
              karakternya["nama"],
              style: new TextStyle(fontSize: 20.0),
            ),
          ],
        )),
      ));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Super Hero",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "img/$gambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 50.0,
                color: Colors.blue,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});

  final IconData icon;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            Icons.call,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            "Call",
            style: new TextStyle(fontSize: 10.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            // https://www.lipsum.com/
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
