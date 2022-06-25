import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yukhiking_app/model/TransaksiModel.dart';

Future<List<Transaksi>> getTransaksi(int id_user) async {
  var response;
  try {
    response =
        await http.get(Uri.parse("http://localhost:8000/api/transaksis"));
  } catch (e) {
    List<Transaksi> exceptionList = [];
    exceptionList.add(Transaksi(
      ID_Transaksi: 999,
      tanggal_Diambil: DateTime.parse('2022-12-03'),
      tanggal_Kembali: DateTime.parse('2022-12-15'),
    ));
    return exceptionList;
  }

  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }
  List body = jsonDecode(response.body);
  List<Transaksi> finalList = [];
  for (var trans in body) {
    if (trans["ID_user"] == id_user) {
      finalList.add(Transaksi(
      ID_Transaksi: trans["ID_Transaksi"],
      tanggal_Diambil: DateTime.parse(trans["tanggal_sewa"]),
      // password: user["password"],
      tanggal_Kembali: DateTime.parse(trans["tanggal_kembali"]),
    ));
    }
  }
  return finalList;
}
