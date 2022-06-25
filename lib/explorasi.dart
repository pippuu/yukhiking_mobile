import 'package:flutter/material.dart';
import 'package:yukhiking_app/api/itemAPI.dart';
import 'package:yukhiking_app/model/ExplorasiModel.dart';
import 'package:yukhiking_app/main.dart';

class ExplorasiPage extends StatefulWidget {
  const ExplorasiPage({Key? key}) : super(key: key);
  @override
  State<ExplorasiPage> createState() => _ExplorasiPageState();
}

class _ExplorasiPageState extends State<ExplorasiPage> {
  // List<DetailBarang> barangList = await getItemData();
  // final barangList = getItemData();
  Future listBarang = getItemData();
  Future listBarang2 = getItemData();

  final Future<List<DetailBarang>> barang2 = getItemData();
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
              child: FutureBuilder(
                  future: listBarang,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred22',
                          style: TextStyle(fontSize: 36),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      List<DetailBarang> data =
                          snapshot.data as List<DetailBarang>;
                      if (data.isEmpty ||
                          data[1].nama_barang == 'defaultUserName') {
                        return const Center(
                          child: Text("defultUserName"),
                        );
                      }
                      return ListView.separated(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int idx) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Detail(detailBarang: data[idx])));
                              },
                              child: Container(
                                  width: 200.0,
                                  margin:
                                      EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 10.0),
                                  padding: const EdgeInsets.all(8),
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //     image: AssetImage(
                                  //         'assets/images/kompor listrik.jpeg'),
                                  //     // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[idx].nama_barang,
                                          style: TextStyle(
                                            color: Colors.blue[200],
                                          ),
                                        ),
                                        Text(data[idx].nama_toko),
                                      ])));
                        },
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int idx) =>
                            const Divider(),
                        shrinkWrap: true,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),

              // ListView.separated(
              //   itemCount: 10,
              //   itemBuilder: (BuildContext context, int idx) {
              //     return GestureDetector(
              //         onTap: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => detail(detailbarang[5])));
              //         },
              //         child: Container(
              //             width: 200.0,
              //             margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 10.0),
              //             padding: const EdgeInsets.all(8),
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image: AssetImage(
              //                     'assets/images/kompor listrik.jpeg'),
              //                 // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
              //                 fit: BoxFit.fill,
              //               ),
              //             ),
              //             child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Kompor Listrik',
              //                     style: TextStyle(
              //                       color: Colors.blue[200],
              //                     ),
              //                   ),
              //                   Text('Amogus Shop'),
              //                 ])));
              //   },
              //   scrollDirection: Axis.horizontal,
              //   separatorBuilder: (BuildContext context, int idx) =>
              //       const Divider(),
              //   shrinkWrap: true,
              // ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.all(10),
          //   child: ListView.separated(
          //     itemCount: 5,
          //     itemBuilder: (BuildContext context, int idx) {
          //       return FutureBuilder(
          //           future: listBarang,
          //           builder: (context, snapshot) {
          //             if (snapshot.hasError) {
          //               return Center(
          //                 child: Text(
          //                   '${snapshot.error} occurred',
          //                   style: TextStyle(fontSize: 36),
          //                 ),
          //               );
          //             }
          //             if (snapshot.hasData) {
          //               List<DetailBarang> data =
          //                   snapshot.data as List<DetailBarang>;
          //               if (data.isEmpty ||
          //                   data[1].nama_barang == 'defaultUserName') {
          //                 return const Center(
          //                   child: Text("defultUserName"),
          //                 );
          //               }
          //               return GridView.count(
          //                 primary: false,
          //                 padding: const EdgeInsets.all(20),
          //                 crossAxisSpacing: 20,
          //                 mainAxisSpacing: 20,
          //                 crossAxisCount: 2,
          //                 shrinkWrap: true,
          //                 children: <Widget>[
          //                   GestureDetector(
          //                       onTap: () {
          //                         Navigator.of(context).push(MaterialPageRoute(
          //                             builder: (context) => detail(data[0])));
          //                       },
          //                       child: Container(
          //                           padding: const EdgeInsets.all(8),
          //                           color: Colors.black,
          //                           child: Container(
          //                               decoration: BoxDecoration(
          //                                 image: DecorationImage(
          //                                   image: AssetImage(
          //                                       'assets/images/jashujan.png'),
          //                                   centerSlice: Rect.fromLTWH(
          //                                       0.0, 0.0, 0.0, 5.0),
          //                                   fit: BoxFit.fill,
          //                                 ),
          //                               ),
          //                               height: 100,
          //                               padding: const EdgeInsets.all(15),
          //                               child: Align(
          //                                   alignment: Alignment.bottomLeft,
          //                                   child: Column(
          //                                       mainAxisAlignment:
          //                                           MainAxisAlignment.end,
          //                                       crossAxisAlignment:
          //                                           CrossAxisAlignment.start,
          //                                       children: [
          //                                         Text(
          //                                           data[0].nama_barang,
          //                                           style: TextStyle(
          //                                             color: Colors.blue[200],
          //                                           ),
          //                                         ),
          //                                         Text(data[0].nama_toko),
          //                                       ]))))),
          //                 ],
          //               );
          //             }
          //             return const Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           });
          //     },
          //     scrollDirection: Axis.horizontal,
          //     separatorBuilder: (BuildContext context, int idx) =>
          //         const Divider(),
          //     shrinkWrap: true,
          //   ),
          // ),

          // ListView.separated(
          //   itemCount: 5,
          //   itemBuilder: (BuildContext context, int idx) {
          //     return GridView.count(
          //       primary: false,
          //       padding: const EdgeInsets.all(20),
          //       crossAxisSpacing: 20,
          //       mainAxisSpacing: 20,
          //       crossAxisCount: 2,
          //       shrinkWrap: true,
          //       children: <Widget>[
          //         GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => detail(detailBarang[0])));
          //           },
          //           child: Container(
          //               padding: const EdgeInsets.all(8),
          //               color: Colors.black,
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                     image: AssetImage(
          //                         'assets/images/jashujan.png'),
          //                     centerSlice:
          //                         Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
          //                     fit: BoxFit.fill,
          //                   ),
          //                 ),
          //                 height: 100,
          //                 padding: const EdgeInsets.all(15),
          //                 child: Align(
          //                   alignment: Alignment.bottomLeft,
          //                   child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       listBarang[0].nama_barang,
          //                       style: TextStyle(
          //                         color: Colors.blue[200],
          //                       ),
          //                     ),
          //                     Text(data[0].nama_toko),
          //                   ]
          //                 )
          //               )
          //             )
          //           )
          //         ),
          //         GestureDetector(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => detail(data[1])));
          //             },
          //             child: Container(
          //                 padding: const EdgeInsets.all(8),
          //                 color: Colors.grey[200],
          //                 child: Container(
          //                     decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                         image: AssetImage(
          //                             'assets/images/matras.jpg'),
          //                         // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                     height: 100,
          //                     padding: const EdgeInsets.all(15),
          //                     child: Align(
          //                         alignment: Alignment.bottomLeft,
          //                         child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.end,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 data[1].nama_barang,
          //                                 style: TextStyle(
          //                                   color: Colors.blue[200],
          //                                 ),
          //                               ),
          //                               Text(data[1].nama_toko),
          //                             ]))))),
          //         GestureDetector(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => detail(data[2])));
          //             },
          //             child: Container(
          //                 padding: const EdgeInsets.all(8),
          //                 color: Colors.grey[200],
          //                 child: Container(
          //                     decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                         image: AssetImage(
          //                             'assets/images/tas gunung.jpg'),
          //                         // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                     height: 100,
          //                     padding: const EdgeInsets.all(15),
          //                     child: Align(
          //                         alignment: Alignment.bottomLeft,
          //                         child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.end,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 data[2].nama_barang,
          //                                 style: TextStyle(
          //                                   color: Colors.blue[200],
          //                                 ),
          //                               ),
          //                               Text(data[2].nama_toko),
          //                             ]))))),
          //         GestureDetector(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => detail(data[3])));
          //             },
          //             child: Container(
          //                 padding: const EdgeInsets.all(8),
          //                 color: Colors.grey[200],
          //                 child: Container(
          //                     decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                         image: AssetImage(
          //                             'assets/images/sarung tangan.jpg'),
          //                         // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                     height: 100,
          //                     padding: const EdgeInsets.all(15),
          //                     child: Align(
          //                         alignment: Alignment.bottomLeft,
          //                         child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.end,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 data[3].nama_barang,
          //                                 style: TextStyle(
          //                                   color: Colors.blue[200],
          //                                 ),
          //                               ),
          //                               Text(data[3].nama_toko),
          //                             ]))))),
          //         GestureDetector(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => detail(data[4])));
          //             },
          //             child: Container(
          //                 padding: const EdgeInsets.all(8),
          //                 color: Colors.grey[200],
          //                 child: Container(
          //                     decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                         image: AssetImage(
          //                             'assets/images/sepatu gunung.jpg'),
          //                         // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                     height: 100,
          //                     padding: const EdgeInsets.all(15),
          //                     child: Align(
          //                         alignment: Alignment.bottomLeft,
          //                         child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.end,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 data[4].nama_barang,
          //                                 style: TextStyle(
          //                                   color: Colors.blue[200],
          //                                 ),
          //                               ),
          //                               Text(data[4].nama_toko),
          //                             ]))))),
          //               ],
          //             );
          //           },
          //           scrollDirection: Axis.horizontal,
          //           separatorBuilder: (BuildContext context, int idx) =>
          //               const Divider(),
          //           shrinkWrap: true,
          //         ),
        ],
      ),
    );
  }
}

class Detail extends StatefulWidget {
  final DetailBarang detailBarang;

  const Detail({Key? key, required this.detailBarang}) : super(key: key);
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late DetailBarang detailBarang = widget.detailBarang;
  final TextEditingController _controllerJumlahSewa = TextEditingController();
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
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Image(
                //       image: AssetImage('assets/images/${detailbarang.link}'),
                //       height: 400,
                //       width: 400),
                // ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        'Nama Barang : ${widget.detailBarang.nama_barang}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Nama Toko : ${widget.detailBarang.nama_toko}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Deskripsi : ${widget.detailBarang.deskripsi}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Harga : ${widget.detailBarang.harga}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Stock : ${widget.detailBarang.stock}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        controller: _controllerJumlahSewa,
                        decoration:
                            const InputDecoration(hintText: 'Jumlah sewa'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (widget.detailBarang.stock >=
                              int.parse(_controllerJumlahSewa.text)) {
                            sendItemData(widget.detailBarang.itemID, 1,
                                int.parse(_controllerJumlahSewa.text));
                          } else {
                            // alert dialog
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Stock tidak cukup'),
                                content: const Text(
                                    "Stock barang yang ingin disewa tidak cukup."),
                                actions: <Widget>[
                                  Center(
                                    child: TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Change Data'),
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
