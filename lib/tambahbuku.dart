import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_1/readBuku.dart';

class TambahBukuPage extends StatefulWidget {
  const TambahBukuPage({super.key});

  @override
  State<TambahBukuPage> createState() => _TambahBukuPageState();
}

class _TambahBukuPageState extends State<TambahBukuPage> {
  final TextEditingController kodeBukuController = TextEditingController();
  final TextEditingController judulBukuController = TextEditingController();
  final TextEditingController penulisBukuController = TextEditingController();
  final TextEditingController penerbitBukuController = TextEditingController();
  final TextEditingController tahunTerbitBukuController =
      TextEditingController();
  final TextEditingController stokBukuController = TextEditingController();

  Future<void> createBuku() async {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/buku'), body: {
      "kode_buku": kodeBukuController.text,
      "judul_buku": judulBukuController.text,
      "penulis_buku": penulisBukuController.text,
      "penerbit_buku": penerbitBukuController.text,
      "tahun_terbit_buku": tahunTerbitBukuController.text,
      "stok": stokBukuController.text
    });

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage1()),
      );
    }
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tambah'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: judulBukuController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'nama buku',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            TextFormField(
              controller: kodeBukuController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'kode buku',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            TextFormField(
              controller: penulisBukuController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'penulis buku',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            TextFormField(
              controller: penerbitBukuController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'penerbit buku',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            TextFormField(
              controller: tahunTerbitBukuController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'tahun terbit buku',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            TextFormField(
              controller: stokBukuController,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'stok buku',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: createBuku,
              child: const Text("Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}
