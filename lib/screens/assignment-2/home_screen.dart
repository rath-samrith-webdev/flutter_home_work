import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.teal[100],
            child: Icon(Icons.person, color: Colors.teal[800]),
          ),
        ),
        title: Text(
          "សួស្ដី​ Rath",
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Khmer Battambang',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withValues(alpha: 0.05),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.indigo[900],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withValues(alpha: 0.03),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Explore your next journey...",
                    hintStyle: TextStyle(color: Colors.indigo[200]),
                    icon: Icon(Icons.search, color: Colors.teal[400]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // Categories
            _buildSectionHeader("Categories"),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem("បព្វតា", Icons.landscape, Colors.teal),
                  _buildCategoryItem(
                    "ឆ្នេសមុទ្រ",
                    Icons.beach_access,
                    Colors.cyan,
                  ),
                  _buildCategoryItem("បឹង", Icons.water, Colors.blue),
                  _buildCategoryItem("ព្រៃ", Icons.forest, Colors.green),
                ],
              ),
            ),

            // Recommend
            _buildSectionHeader("Recommend"),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildRecommendItem(
                    "Swiss Alps",
                    "Europe",
                    "assets/images/alps.png",
                  ),
                  _buildRecommendItem(
                    "Maldives Resort",
                    "Asia",
                    "assets/images/maldives.png",
                  ),
                  _buildRecommendItem(
                    "Lake Como",
                    "Italy",
                    "assets/images/lake_como.png",
                  ),
                ],
              ),
            ),

            // Services
            _buildSectionHeader("សេវាកម្ម"),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildServiceItem("រីសត", Icons.apartment, true),
                  _buildServiceItem("ជើងហោះហើរ", Icons.flight_takeoff, false),
                  _buildServiceItem(
                    "នាវាទេសចរណ៍",
                    Icons.directions_boat,
                    false,
                  ),
                  _buildServiceItem("ដំណើរកំសាន្ត", Icons.explore, false),
                ],
              ),
            ),

            // កម្មវិធីល្បីៗ
            _buildSectionHeader("កម្មវិធីល្បីៗ"),
            _buildTopEvents(),
            SizedBox(height: 40), // Increased bottom spacing
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[900],
              fontFamily: 'Khmer Battambang',
            ),
          ),
          Text(
            "មើលទាំងអស់",
            style: TextStyle(
              color: Colors.teal[700],
              fontWeight: FontWeight.w500,
              fontFamily: 'Khmer Battambang',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, Color color) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withValues(alpha: 0.02),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[800],
              fontFamily: 'Khmer Battambang',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendItem(String title, String location, String imagePath) {
    return Container(
      width: 220,
      margin: EdgeInsets.only(right: 16, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.indigo[900]!.withValues(alpha: 0.8),
            ],
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.teal[100], size: 14),
                SizedBox(width: 4),
                Text(
                  location,
                  style: TextStyle(color: Colors.teal[100], fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(String name, IconData icon, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 12, bottom: 4),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal[600] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withValues(alpha: 0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.teal[600],
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.indigo[800],
              fontWeight: FontWeight.w600,
              fontFamily: 'Khmer Battambang',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopEvents() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildEventItem(
            "Winter Expedition",
            "Book your cabin now and enjoy exclusive discounts.",
            "assets/images/cabin.png",
          ),
          _buildEventItem(
            "Summit Quest",
            "Join our professional climbers for a mountain tour.",
            "assets/images/alps.png",
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String subtitle, String imagePath) {
    return Container(
      width: 320,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              Colors.indigo[900]!.withValues(alpha: 0.9),
              Colors.transparent,
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.teal[50], fontSize: 13),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[400],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "សិក្សាបន្ថែម",
                style: TextStyle(fontFamily: 'Khmer Battambang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
