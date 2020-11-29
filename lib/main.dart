import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworld/gondericarti.dart';
import 'package:sociaworld/profilsayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.grey[900], size: 32.0),
            onPressed: () => {},
          ),
          title: Text(
            'SociaWord',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.purple),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          duyuruMethod(
                              "Berat SARMIŞ Takip etmeye başladı", "Az Önce"),
                          duyuruMethod(
                              "Kerem SARMŞ Mesaj Gönderdi", "5 Gün Önce"),
                          duyuruMethod("Berat SARMIŞ Takip etmeden çıkarttı",
                              "3 gün Önce"),
                        ],
                      );
                    });
              },
            ),
          ]),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 1),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                profilKartiOlustur(
                  "Berat",
                  "https://cdn.pixabay.com/photo/2017/09/16/12/35/anonymous-2755365_1280.jpg",
                  "Berat SARMIŞ",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
                profilKartiOlustur(
                  "Kerem",
                  "https://cdn.pixabay.com/photo/2017/10/05/22/55/anonymous-2821433_1280.jpg",
                  "Kerem SARMIŞ",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
                profilKartiOlustur(
                  "Medine",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                  "Medine SARMIŞ",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
                profilKartiOlustur(
                  "Murat",
                  "https://cdn.pixabay.com/photo/2014/02/17/10/20/statue-of-liberty-267948_1280.jpg",
                  "Murat SARMIŞ",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
                profilKartiOlustur(
                  "Çiğdem",
                  "https://cdn.pixabay.com/photo/2020/11/06/05/33/woman-5716875_1280.png",
                  "Çiğdem SARMIŞ",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
                profilKartiOlustur(
                  "Zeynep",
                  "https://cdn.pixabay.com/photo/2012/04/25/00/03/dove-41260_1280.png",
                  "Zeyne SARMIŞ",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
                profilKartiOlustur(
                  "Gül",
                  "https://cdn.pixabay.com/photo/2012/04/02/14/24/honeybee-24633_1280.png",
                  "Gül Tur",
                  "https://cdn.pixabay.com/photo/2015/12/08/00/58/dreamcatcher-1082228_1280.jpg",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiCarti(
            profilResimLink:
                "https://cdn.pixabay.com/photo/2017/09/16/12/35/anonymous-2755365_1280.jpg",
            isimSoyad: "Berat SARMIŞ",
            gecenSure: "1 saat önce",
            gonderiResimLink:
                "https://cdn.pixabay.com/photo/2017/09/16/12/35/anonymous-2755365_1280.jpg",
            aciklama: "Çok Güzel Bir Hacker Resmi",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.amber,
          child: Icon(Icons.add_a_photo, color: Colors.white)),
    );
  }

  Padding duyuruMethod(String mesaj, String gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(mesaj,
              style: TextStyle(
                fontSize: 15,
              )),
          Text(gecenSure),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLink,
      String isimSoyad, String kapakResimlink) {
    return Material(
      child: InkWell(
        onTap: () async {
          String donenVeri = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ProfileSayfasi(
                profilResimLink: resimLink,
                kullaniciAdi: kullaniciAdi,
                isimSoyad: isimSoyad,
                kapakResmiLinki: kapakResimlink,
              ),
            ),
          );
          print(donenVeri);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Hero(
                  tag: kullaniciAdi,
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(resimLink),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(width: 2.0, color: Colors.white),
                    ))
              ],
            ),
            SizedBox(height: 5),
            Text(kullaniciAdi,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
          ]),
        ),
      ),
    );
  }
}
