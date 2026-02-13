import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, bottom: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.teal[100],
                    child: Icon(Icons.person, size: 60, color: Colors.teal[800]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Raths",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  Text(
                    "Premium Traveler",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatItem("Trips", "12"),
                      Container(width: 1, height: 30, color: Colors.grey[200], margin: EdgeInsets.symmetric(horizontal: 20)),
                      _buildStatItem("Following", "248"),
                      Container(width: 1, height: 30, color: Colors.grey[200], margin: EdgeInsets.symmetric(horizontal: 20)),
                      _buildStatItem("Reviews", "56"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildProfileMenuItem(Icons.person_outline, "Personal Information"),
                  _buildProfileMenuItem(Icons.payment, "Payment Methods"),
                  _buildProfileMenuItem(Icons.notifications_none, "Notification Settings"),
                  _buildProfileMenuItem(Icons.security, "Security & Privacy"),
                  _buildProfileMenuItem(Icons.help_outline, "Help & Support"),
                  SizedBox(height: 16),
                  _buildProfileMenuItem(Icons.logout, "Logout", isDestructive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.indigo[300],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem(IconData icon, String title, {bool isDestructive = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isDestructive ? Colors.redAccent : Colors.teal[600],
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDestructive ? Colors.redAccent : Colors.indigo[900],
            ),
          ),
          Spacer(),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
