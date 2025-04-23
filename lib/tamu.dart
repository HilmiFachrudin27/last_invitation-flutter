import 'package:flutter/material.dart';

class Tamu extends StatefulWidget {
  const Tamu({Key? key}) : super(key: key);

  @override
  _TamuState createState() => _TamuState();
}

class _TamuState extends State<Tamu> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(context, '/home');
      break;
    case 1:
      break;
    case 3:
      Navigator.pushReplacementNamed(context, '/rsvp');
      break;
    case 4:
      Navigator.pushReplacementNamed(context, '/pengaturan');
      break;
    default:
      setState(() {
        _selectedIndex = index;
      });
  }
}


  Widget _buildTamuCard(String nama, String alamat) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          const Icon(Icons.person, color: Colors.green, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  alamat,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.green),
                onPressed: () => print('Tambah aksi untuk $nama'),
              ),
              IconButton(
                icon: const Icon(Icons.contact_emergency, color: Colors.green),
                onPressed: () => print('WhatsApp ke $nama'),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.green),
                onPressed: () => print('Hapus $nama'),
              ),
            ],
          ),
        ],
      ),
    );
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
            Text('Last Invitation', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 5),
            Text('Tamu', style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kotak pencarian
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Cari tamu',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => print('Mencari: $value'),
                ),
              ),
              const SizedBox(height: 20),

              // Daftar tamu
              _buildTamuCard("Alfi Firdaus", "Tasikmalaya"),
              _buildTamuCard("Rina Marlina", "Bandung"),
              _buildTamuCard("Budi Setiawan", "Jakarta"),
              _buildTamuCard("Hilmi Fachurdin", "Jakarta"),
              //_buildTamuCard("Budi Setiawan", "Jakarta"),

              const SizedBox(height: 20),

              // Tombol Tambah dari Kontak & Manual
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => print('Tambah dari Kontak'),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 14, 235, 21),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green),
                        ),
                        child: const Center(
                          child: Text(
                            'Tambah dari Kontak',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => print('Tambah Manual'),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 14, 235, 21),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green),
                        ),
                        child: const Center(
                          child: Text(
                            'Tambah Manual',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dasbor'),
          const BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Tamu'),
          BottomNavigationBarItem(
            icon: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 20),
            ),
            label: 'Payment',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.book_sharp), label: 'rsvp'),
          const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}
