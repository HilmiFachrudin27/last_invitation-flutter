import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTappednav(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/tamu');
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
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Dasbor',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kotak Informasi Pengguna dan Event
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Halo, alfifirdaus0607!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.event, size: 18, color: Colors.green),
                        SizedBox(width: 6),
                        Text(
                          'Nama Event: Ina Amalia & Alfi Firdaus',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 18, color: Colors.green),
                        SizedBox(width: 6),
                        Text(
                          'Waktu: 25 Juni 2025',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Baris Export to Excel dan Total Check-in
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Export to Excel',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'Total Check-in: 4',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Kotak Pencarian
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cari Tamu',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Daftar Tamu
              _buildGuestCard('Asep', '22/04/25 09.00'),
              const SizedBox(height: 5),
              _buildGuestCard('Budi', '22/04/25 09.00'),
              const SizedBox(height: 5),
              _buildGuestCard('Citra', '22/04/25 09.10'),
              const SizedBox(height: 5),
              _buildGuestCard('Dedi', '22/04/25 09.20'),
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

  Widget _buildGuestCard(String name, String time) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 30, color: Colors.green),
              const SizedBox(width: 6),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 36),
              Text(
                time,
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
              const Text(
                'Checked In',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
