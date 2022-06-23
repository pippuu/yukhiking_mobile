import 'package:flutter/material.dart';
import 'model/TransaksiModel.dart';

class TransaksiPage extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            alignment: Alignment.topLeft,
            child: Text(
              'Riwayat Transaksi',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: transaksi.length,
                itemBuilder: (context, index) {
                  // final trans = transaksi[index];
                  return Card(
                    child: ListTile(
                      title: Text('Nama Agent: ${transaksi[index].namaAgent}'),
                      subtitle:
                          Text('Status barang: ${transaksi[index].status}'),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TransaksiDetail(transaksi[index])));
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class TransaksiDetail extends StatelessWidget {
  final Transaksi transaksi;
  const TransaksiDetail(this.transaksi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(title: Text("Detail Transaksi")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.all(10.0),
            height: 200,
            width: 600,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nama Agent : ${transaksi.namaAgent}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        'Tanggal Diambil : ${transaksi.tanggal_Diambil}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Tanggal Kembali : ${transaksi.tanggal_Kembali}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Status Barang : ${transaksi.status}',
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
//                
//                