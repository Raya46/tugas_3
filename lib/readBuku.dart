import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning_1/tambahbuku.dart';
import 'package:learning_1/updateBuku.dart';

class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  List<dynamic> booksData = [];

  Future<void> fetchBooks() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/buku'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        booksData = data['data'];
      });
      print(booksData);
    }
  }

  Future<void> deleteBook(int id) async {
    final response =
        await http.delete(Uri.parse('http://127.0.0.1:8000/api/buku/$id'));

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage1()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: booksData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booksData[index]['judul_buku']),
                          Text(booksData[index]['penulis_buku']),
                          Text(booksData[index]['kode_buku']),
                          Text(booksData[index]['penerbit_buku']),
                          Text(booksData[index]['stok'].toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              deleteBook(booksData[index]['id']);
                            },
                            child: const Text("delete"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateBukuPage(
                                          id: booksData[index]['id'],
                                          judulBuku: booksData[index]
                                              ['judul_buku'],
                                          kodeBuku: booksData[index]
                                              ['kode_buku'],
                                          penulisBuku: booksData[index]
                                              ['penulis_buku'],
                                          penerbitBuku: booksData[index]
                                              ['penerbit_buku'],
                                          tahunTerbitBuku: booksData[index]
                                              ['tahun_terbit_buku'],
                                          stokBuku: booksData[index]['stok'],
                                        )),
                              );
                            },
                            child: const Text("edit"),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TambahBukuPage()),
                      );
                    },
                    child: const Text("Tambah"),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
