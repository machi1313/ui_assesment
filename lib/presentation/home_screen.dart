import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFACAAF3), Color(0xFF6A4EBB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Positioned(
            top: 60,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.attach_money, color: Colors.white, size: 32),
                    SizedBox(width: 4),
                    Text(
                      "Prakthis",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Wallet Balance",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 6),
                const Text(
                  "\$15,123.45",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(child: _gradientButton("Send")),
                    const SizedBox(width: 16),
                    Expanded(child: _gradientButton("Request")),
                  ],
                ),
              ],
            ),
          ),

          /// ===================== Three-color Gradient Section =====================
          Positioned(
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF3CE97),
                    Color(0xFF9F36F1),
                    Color(0xFFFB4BFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    /// Promo Banner first
                    _buildPromoBanner(),
                  ],
                ),
              ),
            ),
          ),

          /// ===================== White Bottom Section =====================
          Positioned(
            top: size.height * 0.45,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    /// Quick Actions below promo banner
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quick Actions",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "See More",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // spreads them evenly
                      children: [
                        _quickActionCard(
                          "Transfer",
                          "assets/icons/ic_transfer.png",
                          AppColors.lightViolet1,
                          AppColors.lightViolet2,
                          Colors.deepPurple,
                        ),
                        _quickActionCard(
                          "Top-up",
                          "assets/icons/ic_topup.png",
                          AppColors.biscuit1,
                          AppColors.biscuit2,
                          Colors.amberAccent,
                        ),
                        _quickActionCard(
                          "Payment",
                          "assets/icons/ic_payment.png",
                          AppColors.lightGreen1,
                          AppColors.lightGreen2,
                          Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    /// Transactions
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "See More",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _transactionTile(
                      avatar: "assets/images/avatar.png",
                      name: "John Doe",
                      date: "12 Dec, 2024",
                      amount: "-\$45.00",
                      isDebit: true,
                    ),
                    _transactionTile(
                      avatar: "assets/images/avatar.png",
                      name: "Emily",
                      date: "10 Dec, 2024",
                      amount: "+\$220.00",
                      isDebit: false,
                    ),
                    _transactionTile(
                      avatar: "assets/images/avatar.png",
                      name: "Amazon",
                      date: "08 Dec, 2024",
                      amount: "-\$120.00",
                      isDebit: true,
                    ),
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
}

/// ===================== Gradient Buttons =====================
Widget _gradientButton(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.white),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),
  );
}

/// ===================== Quick Action Card =====================
Widget _quickActionCard(
  String title,
  String assetPath,
  Color gradientcolor1,
  Color gradientcolor2,
  Color assetColor,
) {
  return Container(
    padding: const EdgeInsets.all(23),
    decoration: BoxDecoration(
      color: Colors.white,
      gradient: LinearGradient(
        colors: [gradientcolor1, gradientcolor2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 26, // keep circle size same
          backgroundColor: Colors.white,
          child: Image.asset(
            assetPath,
            width: 24, // smaller icon width
            height: 24, // smaller icon height
            color: assetColor,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

/// ===================== Transactions Tile =====================
Widget _transactionTile({
  required String avatar,
  required String name,
  required String date,
  required String amount,
  required bool isDebit,
}) {
  return ListTile(
    leading: CircleAvatar(radius: 26, backgroundImage: AssetImage(avatar)),
    title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
    subtitle: Text(date),
    trailing: Column(
      children: [
        Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          "Transfer",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color:Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

/// ===================== Promo Banner =====================
Widget _buildPromoBanner() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.confirmation_num_outlined,
                color: Colors.black,
                size: 23,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "New promo!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Get Promo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
