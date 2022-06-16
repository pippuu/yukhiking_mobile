class DetailBarang {
  final String gambar;
  final String nama_barang;
  final String nama_toko;
  final String deskripsi;

  const DetailBarang(
      {required this.gambar,
      required this.nama_barang,
      required this.nama_toko,
      required this.deskripsi});
}

List<DetailBarang> detailbarang = [
  DetailBarang(
    gambar: "Jaket Gunung",
    nama_barang: "Jaket Gunung",
    nama_toko: "Bogieee Shop",
    deskripsi: "Jaket gunung super tebal yang bisa menghangatkan badan",
  ),
  DetailBarang(
    gambar: "Bayu",
    nama_barang: "19-04-2021",
    nama_toko: "11-07-2022",
    deskripsi: "Sedang disewa",
  ),
  DetailBarang(
    gambar: "Kola",
    nama_barang: "11-08-2021",
    nama_toko: "10-09-2022",
    deskripsi: "Sedang disewa",
  ),
  DetailBarang(
    gambar: "Dindin",
    nama_barang: "01-04-2021",
    nama_toko: "12-07-2022",
    deskripsi: "Sedang disewa",
  ),
  DetailBarang(
    gambar: "Arya",
    nama_barang: "19-04-2021",
    nama_toko: "08-07-2022",
    deskripsi: "Sedang disewa",
  ),
  DetailBarang(
    gambar: "Alphine",
    nama_barang: "22-04-2021",
    nama_toko: "30-07-2022",
    deskripsi: "Sedang disewa",
  ),
  DetailBarang(
    gambar: "Rapip",
    nama_barang: "19-03-2021",
    nama_toko: "15-07-2022",
    deskripsi: "Sedang disewa",
  ),
];
