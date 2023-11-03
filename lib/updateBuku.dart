import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_1/readBuku.dart';

class UpdateBukuPage extends StatefulWidget {
  final int id;
  final String judulBuku;
  final String kodeBuku;
  final String penulisBuku;
  final String penerbitBuku;
  final String tahunTerbitBuku;
  final int stokBuku;
  const UpdateBukuPage(
      {super.key,
      required this.id,
      required this.judulBuku,
      required this.kodeBuku,
      required this.penulisBuku,
      required this.penerbitBuku,
      required this.tahunTerbitBuku,
      required this.stokBuku});

  @override
  State<UpdateBukuPage> createState() => _UpdateBukuPageState();
}

class _UpdateBukuPageState extends State<UpdateBukuPage> {
  final TextEditingController kodeBukuController = TextEditingController();
  final TextEditingController judulBukuController = TextEditingController();
  final TextEditingController penulisBukuController = TextEditingController();
  final TextEditingController penerbitBukuController = TextEditingController();
  final TextEditingController tahunTerbitBukuController =
      TextEditingController();
  final TextEditingController stokBukuController = TextEditingController();

  Future<void> updateBuku() async {
    final response = await http.put(
        Uri.parse('http://127.0.0.1:8000/api/buku/edit/${widget.id}'),
        body: {
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
    print(stokBukuController.text);
  }

  @override
  void initState() {
    kodeBukuController.text = widget.kodeBuku;
    judulBukuController.text = widget.judulBuku;
    penulisBukuController.text = widget.penulisBuku;
    penerbitBukuController.text = widget.penerbitBuku;
    tahunTerbitBukuController.text = widget.tahunTerbitBuku;
    stokBukuController.text = widget.stokBuku.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit'),
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
              onPressed: updateBuku,
              child: const Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }
}
