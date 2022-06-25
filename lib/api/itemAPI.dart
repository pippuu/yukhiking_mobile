import 'dart:convert';
import 'package:http/http.dart' as http;
// if needed: flutter pub add http
import 'package:yukhiking_app/model/ExplorasiModel.dart';

Future<List<DetailBarang>> getItemData() async {
  final response;
  try {
    response = await http.get(Uri.parse("http://localhost:8000/api/items"));
  } catch (e) {
    List<DetailBarang> exceptionList = [];
    exceptionList.add(DetailBarang(
      nama_barang: 'testnamabarang',
      nama_toko: 'testnamatoko',
      harga: 999,
      stock: 999,
      itemID: 999,
      deskripsi: 'test',
    ));
    return exceptionList;
  }

  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data xet," + response.statusCode;
  }
  List body = jsonDecode(response.body);
  List<DetailBarang> itemList = [];
  for (var item in body) {
    itemList.add(DetailBarang(
      // nama_barang: item["Nama_Barang"],
      // nama_toko: "Amogus",
      // harga: item["Harga"],
      // stock: item["Stock"],
      // itemID: item["ID_Items"],
      // deskripsi: "test",
      nama_barang: item["Nama_Barang"],
      nama_toko: "Amogus",
      harga: int.parse(item["Harga"]),
      stock: item["Stock"],
      itemID: item["ID_Items"],
      deskripsi: item["Deskripsi"],
    ));
  }
  return itemList;
  // return snapshot(itemList);
}

Future sendItemData(int id_item, int id_penyewa, int jumlah_sewa) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/api/transaksis/commit'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode(<String, int>{
      'id_item': id_item,
      'id_penyewa': id_penyewa,
      'jumlah_sewa': jumlah_sewa,
    }),
  );
}
