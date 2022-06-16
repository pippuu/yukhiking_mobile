import 'package:flutter/material.dart';

import 'model/DetailBarang.dart';

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
