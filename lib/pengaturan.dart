import 'package:flutter/material.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  int _selectedIndex = 4;

  final TextEditingController _eventNameController =
      TextEditingController(text: 'Ina Amalia & AlfiFirdaus');
  final TextEditingController _invitationMessageController =
      TextEditingController(text: 'Kepada Yth.');

  bool _isLayarSapaAktif = true;

  void _onItemTappednav(int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(context, '/home');
      break;
    case 1:
      Navigator.pushReplacementNamed(context, '/tamu');
      break;
    case 3:
      Navigator.pushReplacementNamed(context, '/rsvp'); // Tambahkan ini
      break;
    case 4:
      // Sudah di halaman Pengaturan
      break;
    default:
      setState(() {
        _selectedIndex = index;
      });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Last Invitation',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'Pengaturan',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit Nama Event',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _eventNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama event',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pesan Undangan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _invitationMessageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan pesan undangan',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Akses Layar Sapa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                value: _isLayarSapaAktif,
                onChanged: (value) {
                  setState(() {
                    _isLayarSapaAktif = value;
                  });
                },
                title: Text(
                  _isLayarSapaAktif ? 'Aktif' : 'Nonaktif',
                  style: const TextStyle(fontSize: 14),
                ),
                activeColor: Colors.green,
              ),
                            const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print('Nama Event: ${_eventNameController.text}');
                  print('Pesan Undangan: ${_invitationMessageController.text}');
                  print('Layar Sapa Aktif: $_isLayarSapaAktif');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pengaturan disimpan')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Simpan Perubahan',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Warna merah solid
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTappednav,
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dasbor',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Tamu',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 20,
              ),
            ),
            label: 'Payment',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'rsvp',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
