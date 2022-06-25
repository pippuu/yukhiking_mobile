import 'package:flutter/material.dart';
import 'package:yukhiking_app/api/itemAPI.dart';
import 'package:yukhiking_app/api/transaksiAPI.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/model/ExplorasiModel.dart';
import 'model/TransaksiModel.dart';

class TransaksiPage extends StatefulWidget {
  final int id_user;
  const TransaksiPage({Key? key, required this.id_user}) : super(key: key);
  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  late Future<List<Transaksi>> transaksiList = getTransaksi(widget.id_user);
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
              'Daftar Transaksi',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: transaksiList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error when fetching data"),
                      );
                    }
                    if (snapshot.hasData) {
                      List<Transaksi> data = snapshot.data as List<Transaksi>;
                      if (data.isEmpty
                          // || data[0].username == 'defaultUserName'
                          ) {
                        return const Center(
                          child: Text("Data is empty"),
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            // final trans = transaksi[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                    'ID Transaksi: ${data[index].ID_Transaksi}'),
                                subtitle: Text('Status: Sedang Disewa'),
                                trailing: const Icon(Icons.arrow_forward),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TransaksiDetail(data[index])));
                                },
                              ),
                            );
                          });
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
        ],
      ),
    );
  }
}

class TransaksiDetail extends StatefulWidget {
  final Transaksi transaksi;
  const TransaksiDetail(this.transaksi);

  @override
  State<TransaksiDetail> createState() => _TransaksiDetailState();
}

class _TransaksiDetailState extends State<TransaksiDetail> {
  Future<List<DetailBarang>> itemList = getItemData();

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
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     'Nama Agent : ${transaksi.ID_transaksi}',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                //   ),
                // ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        'Tanggal Diambil : ${widget.transaksi.tanggal_Diambil.day}-${widget.transaksi.tanggal_Diambil.month}-${widget.transaksi.tanggal_Diambil.year}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Tanggal Kembali : ${widget.transaksi.tanggal_Kembali.day}-${widget.transaksi.tanggal_Kembali.month}-${widget.transaksi.tanggal_Kembali.year}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      FutureBuilder(
                          future: itemList,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Error when fetching data"),
                              );
                            }
                            if (snapshot.hasData) {
                              List<DetailBarang> data =
                                  snapshot.data as List<DetailBarang>;
                              if (data.isEmpty
                                  // || data[0].username == 'defaultUserName'
                                  ) {
                                return const Center(
                                  child: Text("Data is empty"),
                                );
                              }
                              int idx = 0;
                              int found = 0;
                              for (var item in data) {
                                if (item.transaksiID ==
                                    widget.transaksi.ID_Transaksi) {
                                  found = idx;
                                }
                                idx = idx + 1;
                              }
                              return Column(children: [
                                Text(
                                  'Barang : ${data[found].nama_barang}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  'Jumlah sewa : ${data[found].stock}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ]);
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
