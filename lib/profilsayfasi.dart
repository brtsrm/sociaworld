import 'package:flutter/material.dart';
import 'package:sociaworld/gondericarti.dart';

class ProfileSayfasi extends StatelessWidget {
  final String isimSoyad;
  final String kullaniciAdi;
  final String kapakResmiLinki;
  final String profilResimLink;

  const ProfileSayfasi(
      {Key key,
      this.isimSoyad,
      this.kullaniciAdi,
      this.kapakResmiLinki,
      this.profilResimLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(kapakResmiLinki),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: Hero(
                  tag: kullaniciAdi,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(width: 2.0, color: Colors.white),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profilResimLink),
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 145,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        isimSoyad,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        kullaniciAdi,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
              ),
              Positioned(
                right: 15.0,
                top: 130.0,
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[200],
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_circle, size: 18.0),
                      SizedBox(width: 2.0),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context, "Döndüm");
                },
              ),
            ],
          ),
          SizedBox(height: 40.0),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                sayac("Takipçi", "21K"),
                sayac("Takip", "500"),
                sayac("Paylaşım", "75"),
              ],
            ),
          ),
          GonderiCarti(
            profilResimLink: profilResimLink,
            isimSoyad: "Berat SARMIŞ",
            gecenSure: "1 saat önce",
            gonderiResimLink:
                "https://cdn.pixabay.com/photo/2017/09/16/12/35/anonymous-2755365_1280.jpg",
            aciklama: "Çok Güzel Bir Hacker Resmi",
          ),
        ],
      ),
    );
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          sayi,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
