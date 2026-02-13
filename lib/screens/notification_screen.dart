import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        "title": "Booking Confirmed",
        "message": "Your trip to Swiss Alps is confirmed! Check your email for details.",
        "time": "2h ago",
        "icon": "Icons.check_circle_outline",
        "color": "teal"
      },
      {
        "title": "Flight Update",
        "message": "Your flight to Maldives has been delayed by 30 minutes.",
        "time": "5h ago",
        "icon": "Icons.flight_takeoff",
        "color": "indigo"
      },
      {
        "title": "Exclusive Offer",
        "message": "Get 20% off on your next booking with the code EXPLORE20.",
        "time": "1d ago",
        "icon": "Icons.local_offer_outlined",
        "color": "cyan"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          IconData displayIcon;
          Color displayColor;

          switch (item['color']) {
            case 'teal':
              displayIcon = Icons.check_circle_outline;
              displayColor = Colors.teal;
              break;
            case 'indigo':
              displayIcon = Icons.flight_takeoff;
              displayColor = Colors.indigo;
              break;
            default:
              displayIcon = Icons.local_offer_outlined;
              displayColor = Colors.cyan;
          }

          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.03),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: displayColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(displayIcon, color: displayColor, size: 24),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[900],
                            ),
                          ),
                          Text(
                            item['time']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.indigo[200],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        item['message']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.indigo[600],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
