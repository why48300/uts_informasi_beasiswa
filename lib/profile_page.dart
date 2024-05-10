import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pp.jpg'),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            ProfileField(
              label: 'Name',
              value: 'Rizal Ardi', // Ubah dengan nama pengguna yang sebenarnya
            ),
            ProfileField(
              label: 'Email',
              value:
                  'rixalardi123@gmail.com', // Ubah dengan email pengguna yang sebenarnya
            ),
            ProfileField(
              label: 'Password',
              value: '••••••••', // Tidak menampilkan password secara langsung
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Tambahkan fungsi untuk mereset password
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
