import 'package:flutter/material.dart';

class RSVP extends StatefulWidget {
  const RSVP({Key? key}) : super(key: key);

  @override
  _RSVPState createState() => _RSVPState();
}

class _RSVPState extends State<RSVP> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/tamu');
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

  Widget _buildInfoCard(String value, String title, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRSVPCard(String nama, String status, String pesan) {
  Color statusColor;
  switch (status) {
    case 'Hadir':
      statusColor = Colors.green;
      break;
    case 'Masih Ragu':
      statusColor = Colors.orange;
      break;
    case 'Tidak Hadir':
      statusColor = Colors.red;
      break;
    default:
      statusColor = Colors.grey;
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: statusColor.withOpacity(0.5)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Nama dan Icon
            Row(
              children: [
                Icon(Icons.person, color: statusColor, size: 28),
                const SizedBox(width: 10),
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // Status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: statusColor),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          pesan,
          style: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.black54,
          ),
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
            Text('RSVP & Ucapan', style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('4', 'Hadir', Colors.green),
                _buildInfoCard('10', 'Masih Ragu', Colors.orange),
                _buildInfoCard('5', 'Tidak Hadir', Colors.red),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              'Daftar RSVP:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            _buildRSVPCard("Alfi Firdaus", "Hadir", "Selamat menikah, semoga Sakinah, Mawaddah, Warahmah"),
            _buildRSVPCard("Rina Marlina", "Masih Ragu", "Selamat menikah, semoga Sakinah, Mawaddah, Warahmah"),
            _buildRSVPCard("Budi Setiawan", "Tidak Hadir", "Selamat menikah, semoga Sakinah, Mawaddah, Warahmah"),
            _buildRSVPCard("Hilmi Fachurdin", "Hadir", "Selamat menikah, semoga Sakinah, Mawaddah, Warahmah"),
          ],
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dasbor'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Tamu'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 20),
            ),
            label: 'Payment',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book_sharp), label: 'rsvp'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}
