class DetailBarang {
  // final String gambar;
  final String nama_barang, nama_toko, deskripsi;
  final int harga, stock, itemID;
  // final String link;

  DetailBarang({
    // required this.gambar,
    required this.nama_barang,
    required this.nama_toko,
    required this.deskripsi,
    required this.harga,
    required this.stock,
    required this.itemID,
    // required this.link
  });
}

class contohBarang {
  final String gambar, nama_barang, nama_toko, deskripsi, link;
  // final String link;

  const contohBarang({
    // required this.gambar,
    required this.gambar,
    required this.nama_barang,
    required this.nama_toko,
    required this.deskripsi,
    required this.link,
    // required this.link
  });
}

List<contohBarang> detailBarang = [
  const contohBarang(
    gambar: "Jaket Gunung",
    nama_barang: "Jaket Gunung",
    nama_toko: "Bogieee Shop",
    deskripsi: "Jaket gunung super tebal yang bisa menghangatkan badan",
    link: "jashujan.png",
  ),
  const contohBarang(
    gambar: "Bayu",
    nama_barang: "19-04-2021",
    nama_toko: "11-07-2022",
    deskripsi: "Sedang disewa",
    link: "matras.jpg",
  ),
  const contohBarang(
    gambar: "Kola",
    nama_barang: "11-08-2021",
    nama_toko: "10-09-2022",
    deskripsi: "Sedang disewa",
    link: "tas gunung.jpg",
  ),
  const contohBarang(
    gambar: "Dindin",
    nama_barang: "01-04-2021",
    nama_toko: "12-07-2022",
    deskripsi: "Sedang disewa",
    link: "sarung tangan.jpg",
  ),
  const contohBarang(
    gambar: "Arya",
    nama_barang: "19-04-2021",
    nama_toko: "08-07-2022",
    deskripsi: "Sedang disewa",
    link: "sepatu gunung.jpg",
  ),
  const contohBarang(
    gambar: "Alphine",
    nama_barang: "22-04-2021",
    nama_toko: "30-07-2022",
    deskripsi: "Sedang disewa",
    link: "kompor listrik.jpeg",
  ),
  const contohBarang(
    gambar: "Rapip",
    nama_barang: "19-03-2021",
    nama_toko: "15-07-2022",
    deskripsi: "Sedang disewa",
    link: "jashujan.png",
  ),
  const contohBarang(
    gambar: "Kompor Listrik",
    nama_barang: "19-03-2021",
    nama_toko: "15-07-2022",
    deskripsi: "Sedang disewa",
    link: "jashujan.png",
  ),
];

class ItemDataToSend {
  final int id_item, id_penyewa, jumlah_sewa;
  ItemDataToSend(this.id_item, this.id_penyewa, this.jumlah_sewa);
}
