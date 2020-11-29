import 'package:flutter/material.dart';

class GonderiCarti extends StatelessWidget {
  final String profilResimLink;
  final String isimSoyad;
  final String gecenSure;
  final String gonderiResimLink;
  final String aciklama;

  const GonderiCarti(
      {Key key,
      this.profilResimLink,
      this.isimSoyad,
      this.gecenSure,
      this.gonderiResimLink,
      this.aciklama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: 388.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo,
                          image: DecorationImage(
                            image: NetworkImage(profilResimLink),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            isimSoyad,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            gecenSure,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                aciklama,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              Image.network(
                gonderiResimLink,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.grey),
                    label: Text("Beğen",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  IkonluButtonum(
                      ikonum: Icons.comment,
                      yazi: "Yorum Yap",
                      fonksiyonum: () {
                        print("yorum yap");
                      }),
                  IkonluButtonum(
                      ikonum: Icons.share,
                      yazi: "Paylaş",
                      fonksiyonum: () {
                        print("paylaş");
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IkonluButtonum extends StatelessWidget {
  final IconData ikonum;
  final String yazi;
  final fonksiyonum;
  IkonluButtonum({this.ikonum, this.yazi, this.fonksiyonum});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: fonksiyonum,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(ikonum, color: Colors.grey),
              SizedBox(width: 8.0),
              Text(
                yazi,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
