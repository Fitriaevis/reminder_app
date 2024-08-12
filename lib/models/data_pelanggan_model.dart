class DataPelanggan {
  final String noAgendaPesta;
  final String nama;
  final String alamat;
  final String daya;
  final String tglSelesai;

  DataPelanggan({
    required this.noAgendaPesta,
    required this.nama,
    required this.alamat,
    required this.daya,
    required this.tglSelesai,
  });

  factory DataPelanggan.fromJson(Map<String, dynamic> json) {
    return DataPelanggan(
      noAgendaPesta: json['no_agenda_pesta'],
      nama: json['nama'],
      alamat: json['alamat'],
      daya: json['daya'],
      tglSelesai: json['tgl_selesai'],
    );
  }
}
