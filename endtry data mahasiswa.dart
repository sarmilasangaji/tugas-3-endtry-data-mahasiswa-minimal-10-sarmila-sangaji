import 'dart:io';

List<Map<String, String>> dataMahasiswa = [];

void main() {
  int jumlahEntriMinimal = 10;
 
  entryData(jumlahEntriMinimal);

  print('\n======================================');
  print('=== DATA MAHASISWA ===');
  print('======================================');
  
  stdout.write('Masukkan NPM mahasiswa yang ingin dicari: ');
 
  String nimCari = stdin.readLineSync() ?? ''; 
  
  cariMahasiswa(nimCari);
}

String getInput(String prompt) {
  String? input;
  do {
    stdout.write(prompt);
    input = stdin.readLineSync();
    
    if (input == null || input.trim().isEmpty) {
      print(' ERROR: Data ini wajib diisi. Silakan masukkan kembali.');
    }
  } while (input == null || input.trim().isEmpty);
  
  return input;
}

void entryData(int jumlah) {
  print('--- DATA MAHASISWA (${jumlah} data) ---');
  for (int i = 0; i < jumlah; i++) {
    print('\nMasukkan Data Mahasiswa ke-${i + 1}:');
    String NPM = getInput('1. NPM: ');
    String nama = getInput('2. Nama Lengkap: ');
    String tglLahir = getInput('3. Tanggal Lahir (DD/MM/YYYY): ');
    String jurusan = getInput('4. Jurusan: ');
    String alamat = getInput('5. Alamat: ');

    Map<String, String> mahasiswa = {
      'NPM': NPM,
      'Nama': nama,
      'Jurusan': jurusan,
      'Alamat': alamat,
      'Tanggal Lahir': tglLahir,
    };
    
    dataMahasiswa.add(mahasiswa);
    print('Data berhasil ditambahkan. ');
  }
}

void cariMahasiswa(String nimCari) {
  if (dataMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa yang dientri.');
    return;
  }
  
  bool ditemukan = false;
  
  for (var mhs in dataMahasiswa) {

    if (mhs['NPM'] == nimCari) {
      print('\n--- HASIL PENCARIAN (NIM: $nimCari) ---');
      print('Status         : Ditemukan! ');
      print('Nama           : ${mhs['Nama']}');
      print('Jurusan        : ${mhs['Jurusan']}');
      print('Alamat         : ${mhs['Alamat']}');
      print('Tanggal Lahir  : ${mhs['Tanggal Lahir']}');
      ditemukan = true;
      break; 
    }
  }
  
  if (!ditemukan) {
    print('\n--- HASIL PENCARIAN (NPM: $nimCari) ---');
    print('Status         : TIDAK DITEMUKAN. ');
  }
}