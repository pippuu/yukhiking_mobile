import 'package:flutter/material.dart';

import 'model/ExplorasiModel.dart';

class ExplorasiPage extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            alignment: Alignment.topLeft,
            child: Text(
              'Eksplorasi',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          Container(
            height: 260.0,
            color: Colors.blue[300],
            alignment: Alignment.center,
            child: Center(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (BuildContext context, int idx) {
                  return Container(
                      width: 200.0,
                      margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 10.0),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/kompor listrik.jpeg'),
                          // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kompor Listrik',
                              style: TextStyle(
                                color: Colors.blue[200],
                              ),
                            ),
                            Text('Amogus Shop'),
                          ]));
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int idx) =>
                    const Divider(),
                shrinkWrap: true,
              ),
            ),
          ),
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => detail(detailbarang[0])));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey[200],
                      child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/jashujan.png'),
                              // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          padding: const EdgeInsets.all(15),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jas Hujan Gunung',
                                      style: TextStyle(
                                        color: Colors.blue[200],
                                      ),
                                    ),
                                    Text('Bogieee Shop'),
                                  ]))))),
              Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/matras.jpg'),
                          // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Matras',
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                  ),
                                ),
                                Text('Saiful Shop'),
                              ])))),
              Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/tas gunung.jpg'),
                          // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tas Gunung',
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                  ),
                                ),
                                Text('Jojo Shop'),
                              ])))),
              Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sarung tangan.jpg'),
                          // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sarung Tangan Gunung',
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                  ),
                                ),
                                Text('Dio Shop'),
                              ])))),
              Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sepatu gunung.jpg'),
                          // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sepatu Gunung',
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                  ),
                                ),
                                Text('Anya Shop'),
                              ])))),
            ],
          ),
        ],
      ),
    );
  }
}

class detail extends StatelessWidget {
  final DetailBarang detailbarang;
  const detail(this.detailbarang);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(title: Text("Detail Barang")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.all(10.0),
            height: 600,
            width: 600,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Gambar : ${detailbarang.gambar}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        'Nama Barang : ${detailbarang.nama_barang}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Nama Toko : ${detailbarang.nama_toko}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Deskripsi : ${detailbarang.deskripsi}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
