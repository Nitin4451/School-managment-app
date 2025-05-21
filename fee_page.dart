import 'package:flutter/material.dart';

class FeePage extends StatelessWidget {
  const FeePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> feesList = [
      {
        "receipt": "#98761",
        "month": "October",
        "date": "10 Oct 20",
        "amount": "₹999",
        "action": "PAY NOW"
      },
      {
        "receipt": "#98762",
        "month": "November",
        "date": "12 Nov 20",
        "amount": "₹1050",
        "action": "DOWNLOAD"
      },
      {
        "receipt": "#98763",
        "month": "December",
        "date": "15 Dec 20",
        "amount": "₹1020",
        "action": "DOWNLOAD"
      },
    ];

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
                  onPressed: () => Navigator.pop(context),
                ),
                const Text('Fees Due',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
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
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: feesList.length,
                itemBuilder: (context, index) {
                  final fee = feesList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow("Receipt No.", fee["receipt"]!),
                        _buildInfoRow("Month", fee["month"]!),
                        _buildInfoRow("Payment Date", fee["date"]!),
                        _buildInfoRow("Total Pending Amount", fee["amount"]!),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C61F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                fee["action"]!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                fee["action"] == "PAY NOW"
                                    ? Icons.arrow_forward
                                    : Icons.download,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
