import 'package:flutter/material.dart';

//import terlebih dahulu halaman yang diperlukan
import './detailproduk.dart';

class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        appBar: AppBar(title: Text("HARGA BUKET")),
        //body untuk content
        //menampilkan list
        body: ListView(
          shrinkWrap: true,
          //padding
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          //anggota dari list berupa widget children
          children: <Widget>[
            //GestureDetector untuk menangani gesture pengguna
            new GestureDetector(
              //listener  berupa klik 1x
              onTap: () {
                //navigator.push  untuk berpindah halaman
                Navigator.of(context).push(new MaterialPageRoute(
                  //pemanggilan class DetailProduk beserta pengiriman detail produk
                  builder: (BuildContext context) => DetailProduk(
                    name: "Enchanted Dome - Gold",
                    description:
                        "An exclusive Gold coated Rose Replica. Premium handcrafted classic dome made out of durable borosilicate glass and selected pine wood.",
                    price: 325000,
                    image: "RoseDomeGold.jpg",
                    star: 4,
                  ),
                ));
              },
              //memanggil class Productbox
              child: ProductBox(
                  //berisi parameter yang diperlukan di class ProductBox
                  name: "Enchanted Dome - Gold",
                  description: "Limited Edition",
                  price: 2000000,
                  image: "RoseDomeGold.jpg",
                  star: 4),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Astoria - Pastel Rainbow",
                      description:
                          "Bunga Mawar Super Premium Warna Pastel Rainbow. Diawetkan dengan proses alami dan bertahan hingga 3 tahun. Dikemas dengan Pouch Eksklusif Outerbloom",
                      price: 900000,
                      image: "AstoriaRainbow.jpg",
                      star: 5,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Astoria - Pastel Rainbow",
                    description: "Limited Edition",
                    price: 900000,
                    image: "AstoriaRainbow.jpg",
                    star: 5)),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Grande Midnight Hand Bouquet - Fiery Red",
                      description:
                          "Lovely Arrangement of Red Roses. Decorated with Caspia and Baby Breath. Wrapped in Grey Wrapping Paper, Matched with a Red Bow. Symbolizes Love and Affection",
                      price: 800000,
                      image: "GrandeMidnight.jpg",
                      star: 4,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Grande Midnight Hand Bouquet - Fiery Red",
                    description: "Non Limited",
                    price: 800000,
                    image: "GrandeMidnight.jpg",
                    star: 4)),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk(
                      name: "Red Bearry Valentine",
                      description:
                          "Pelengkap Momen Spesial. 12 Mawar Merah, Baby's Breath, Daun Ruskus, 3 Cokelat dan 1 Boneka. Melambangkan Cinta, Gairah, Kecantikan, Keberanian dan Rasa Hormat.",
                      price: 899000,
                      image: "RedBearryValentin.jpg",
                      star: 5,
                    ),
                  ));
                },
                child: ProductBox(
                    name: "Red Bearry Valentine",
                    description: "Non Limited",
                    price: 899000,
                    image: "RedBearryValentin.jpg",
                    star: 5)),
          ],
        ));
  }
}

//menggunakan widget StatelessWidget
class ProductBox extends StatelessWidget {
  //deklarasi variabel yang diterima dari MyHomePage
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);

  //menampung variabel yang diterima untuk dapat digunakan pada class ini
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];

  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.deepOrange,
      ));
    }
    //menggunakan widget container
    return Container(
        //padding
        padding: EdgeInsets.all(10),
        // height: 120,
        //menggunakan widget card
        child: Card(
            //membuat tampilan secara horisontal antar image dan deskripsi
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children digunakan untuk menampung banyak widget
                children: <Widget>[
              Image.asset(
                "assets/" + image,
                width: 150,
              ),
              Expanded(
                  //child digunakan untuk menampung satu widget
                  child: Container(
                      padding: EdgeInsets.all(5),
                      //membuat tampilan secara vertikal
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //ini isi tampilan vertikal tersebut
                        children: <Widget>[
                          //menampilkan variabel menggunakan widget text
                          Text(this.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(this.description),
                          Text(
                            "Price: " + this.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          //menampilkan widget icon  dibungkus dengan row
                          Row(
                            children: <Widget>[
                              Row(
                                children: children,
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
