import 'package:flutter/material.dart';
import 'package:infor_beasiswa/main.dart';
import 'package:infor_beasiswa/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beasiswa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoBeasiswaPage(),
    );
  }
}

class InfoBeasiswaPage extends StatelessWidget {
  // List of sample scholarships with faculties
  final List<Map<String, String>> scholarships = [
    {
      'faculty': 'Fakultas Hukum Bisnis',
      'name': 'Beasiswa Prestasi',
      'requirements': 'IPK min. 3.5, Aktif berorganisasi',
      'info': 'Beasiswa untuk mahasiswa berprestasi dengan IPK tinggi.'
    },
    {
      'faculty': 'Fakultas Hukum Bisnis',
      'name': 'Beasiswa Peningkatan Prestasi',
      'requirements': 'IPK min. 2.75, Tidak mendapatkan beasiswa lain',
      'info': 'Beasiswa untuk membantu mahasiswa meningkatkan prestasinya.'
    },
    {
      'faculty': 'Fakultas Hukum Bisnis',
      'name': 'Beasiswa Bidikmisi',
      'requirements': 'Kriteria Bidikmisi',
      'info': 'Beasiswa untuk mahasiswa berprestasi dari keluarga tidak mampu.'
    },
    {
      'faculty': 'Fakultas Ilmu Komunikasi',
      'name': 'Beasiswa Komunikasi',
      'requirements': 'IPK min. 3.0, Aktif di organisasi komunikasi',
      'info':
          'Beasiswa untuk mahasiswa FIKOM yang berprestasi di bidang komunikasi.'
    },
    {
      'faculty': 'Fakultas Ilmu Komunikasi',
      'name': 'Beasiswa Jurnalistik',
      'requirements': 'IPK min. 2.75, Aktif di organisasi jurnalistik',
      'info':
          'Beasiswa untuk mahasiswa FIKOM yang berprestasi di bidang jurnalistik.'
    },
    {
      'faculty': 'Fakultas Ilmu Komunikasi',
      'name': 'Beasiswa Penyiaran',
      'requirements': 'IPK min. 3.0, Aktif di organisasi penyiaran',
      'info':
          'Beasiswa untuk mahasiswa FIKOM yang berprestasi di bidang penyiaran.'
    },
    {
      'faculty': 'Fakultas Ilmu Keperawatan dan Kesehatan',
      'name': 'Beasiswa Keperawatan',
      'requirements': 'IPK min. 3.0, Aktif di kegiatan kesehatan masyarakat',
      'info':
          'Beasiswa untuk mahasiswa FIKES yang berprestasi di bidang keperawatan.'
    },
    {
      'faculty': 'Fakultas Ilmu Keperawatan dan Kesehatan',
      'name': 'Beasiswa Kesehatan Masyarakat',
      'requirements': 'IPK min. 3.0, Aktif di kegiatan sosial masyarakat',
      'info':
          'Beasiswa untuk mahasiswa FIKES yang berprestasi di bidang kesehatan masyarakat.'
    },
    {
      'faculty': 'Fakultas Ilmu Keperawatan dan Kesehatan',
      'name': 'Beasiswa Kedokteran',
      'requirements': 'IPK min. 3.5, Aktif di kegiatan riset medis',
      'info':
          'Beasiswa untuk mahasiswa FIKES yang berprestasi di bidang kedokteran.'
    },
    // Add more scholarships for other faculties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Beasiswa'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: scholarships.length,
        itemBuilder: (context, index) {
          final scholarship = scholarships[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 ||
                  scholarships[index - 1]['faculty'] != scholarship['faculty'])
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    scholarship['faculty']!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ListTile(
                title: Text(scholarship['name']!),
                onTap: () {
                  _showScholarshipDetails(context, scholarship);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _showScholarshipDetails(
      BuildContext context, Map<String, String> scholarship) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(scholarship['name']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Fakultas: ${scholarship['faculty']}'),
              SizedBox(height: 10),
              Text('Persyaratan: ${scholarship['requirements']}'),
              SizedBox(height: 10),
              Text('Informasi: ${scholarship['info']}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showRegistrationForm(context);
              },
              child: Text('Daftar'),
            ),
          ],
        );
      },
    );
  }

  void _showRegistrationForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationForm()),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Pendaftaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kelas'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Prodi'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Fakultas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
