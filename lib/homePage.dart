import 'package:flutter/material.dart';

class UjianOnlineBeranda extends StatelessWidget {
  const UjianOnlineBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Ujian Online",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan aksi notifikasi di sini
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80.0),
            InkWell(
              onTap: () {},
              child: buildFeatureCard(
                context: context,
                icon: Icons.assignment,
                title: "Ujian Aktif",
                subtitle: "Lihat daftar ujian yang sedang berlangsung",
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {},
              child: buildFeatureCard(
                context: context,
                icon: Icons.history,
                title: "Riwayat Ujian",
                subtitle: "Lihat riwayat ujian yang telah selesai",
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {},
              child: buildFeatureCard(
                context: context,
                icon: Icons.history,
                title: "Ruang Belajar",
                subtitle: "Belajar materi-materi terbaru dan ratusan kisi-kisi",
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureCard(
      {required IconData icon,
      required String title,
      required String subtitle,
      required Color color,
      required BuildContext context}) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: color,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
