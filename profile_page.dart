import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C61F6), // Blue background
      body: Column(
        children: [
          Container(
            height: 160,
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            color: const Color(0xFF2C61F6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                     onPressed: () {
                       Navigator.pop(context); // This pops the current screen
                       },
                   ),
                const Text('My Profile', style: TextStyle(color: Colors.white, fontSize: 20)),
                TextButton(
                  onPressed: () {},
                  child: const Text('DONE', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 12,right: 12,top: 29),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.white, size: 30),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Akshay Syal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                SizedBox(height: 4),
                                Text('Class XI-B  |  Roll no: 04', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          const Icon(Icons.camera_alt_outlined, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfoRow('Adhar No', '1234 4325 4567 1234'),
                    _buildInfoRow('Academic Year', '2020-2021'),
                    _buildInfoRow('Admission Class', 'VI', locked: true),
                    _buildInfoRow('Old Admission No', 'T00221', locked: true),
                    _buildInfoRow('Date of Admission', '01 Apr 2018', locked: true),
                    _buildInfoRow('Date of Birth', '22 July 1996', locked: true),
                    _buildInfoRow('Parent Mail ID', 'parentboth84@gmail.com', locked: true),
                    _buildInfoRow('Mother Name', 'Monica Larson'),
                    _buildInfoRow('Father Name', 'Bernard Taylor'),
                    _buildInfoRow('Parmanent Add.', 'Karol Bagh, Delhi', locked: true),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildInfoRow(String title, String value, {bool locked = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          if (locked)
            const Icon(Icons.lock, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
