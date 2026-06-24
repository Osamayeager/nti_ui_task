import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountItems = [
      {
        'icon': Icons.person_outline,
        'title': 'Edit Profile',
        'subtitle': 'Rebecca Barbara',
      },
      {
        'icon': Icons.remove_red_eye_outlined,
        'title': 'Privacy',
        'subtitle': 'Manage your data',
      },
      {
        'icon': Icons.shield_outlined,
        'title': 'Security',
        'subtitle': 'Password · 2FA enabled',
      },
    ];
    final List<Map<String, dynamic>> preferenceItems = [
      {
        'icon': Icons.notifications_none_outlined,
        'title': 'Notifications',
        'subtitle': 'Alerts & reminders',
        'isSwitchedOn': true, // The top switch is ON in the design
      },
      {
        'icon': Icons.dark_mode_outlined,
        'title': 'Dark Mode',
        'subtitle': 'Switch appearance',
        'isSwitchedOn': false, // The bottom switch is OFF in the design
      },
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F0),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F0),
          leading: Padding(
            padding: const EdgeInsets.only(left: 22.0, bottom: 8, top: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.menu, size: 18, color: Colors.black),
            ),
          ),
          title: Text(
            'Settings',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xff4A7C6B),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  'RB',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.6,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Container(
                  height: 134,
                  decoration: BoxDecoration(
                    color: Color(0xff2D4A3E),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(
                          "assets/images/Rebecca_Barbara.png",
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rebecca \nBarbara",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "rebecca@smarthome.io",
                            style: TextStyle(
                              color: Color.fromARGB(124, 255, 255, 255),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Color.fromARGB(124, 255, 255, 255),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 46),
                Text(
                  'ACCOUNT',
                  style: TextStyle(
                    color: Color(0xff8A8A80),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        accountItems.length, // Automatically builds 3 times!
                    itemBuilder: (context, index) {
                      // 1. Grab the data for this specific row
                      final item = accountItems[index];

                      // 2. Use that data to build the UI
                      return ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xffF0F0EB,
                            ), // The beige background for the icon
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // We use 'item['icon']' to get the specific icon we defined in our list
                          child: Icon(
                            item['icon'],
                            color: const Color(0xff2D4A3E),
                          ),
                        ),

                        // We use 'item['title']' and 'item['subtitle']' for the text
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          item['subtitle'],
                          style: TextStyle(
                            color: Color(0xff8A8A80),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height:
                            1, // How much vertical space the divider takes up
                        thickness: 1, // How thick the painted line is
                        color: Color(0xFFF7F6F1), // The background beige color
                        indent:
                            70, // Pushes the start of the line to the right, aligning it with the text
                        endIndent:
                            20, // Adds a little padding on the right side
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Preferences',
                  style: TextStyle(
                    color: Color(0xff8A8A80),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7),
                // Place this below your Account section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: preferenceItems.length, // Using our new list

                    itemBuilder: (context, index) {
                      final item = preferenceItems[index];

                      return ListTile(
                        // 1. Your exact leading icon decoration
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xffF0F0EB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            item['icon'],
                            color: const Color(0xff2D4A3E),
                          ),
                        ),

                        // 2. Your exact title styling
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // 3. Your exact subtitle styling
                        subtitle: Text(
                          item['subtitle'],
                          style: const TextStyle(
                            color: Color(0xff8A8A80),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // 4. The Switch widget for the Preferences section
                        trailing: Switch(
                          value: item['isSwitchedOn'],
                          onChanged: (bool value) {}, // Static for now
                          activeThumbColor: Colors.white,
                          activeTrackColor: const Color(
                            0xff2D4A3E,
                          ), // Matching your dark green hex code!
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade300,
                        ),
                      );
                    },

                    // The exact same separator from before!
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFF7F6F1),
                        indent: 70,
                        endIndent: 20,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Place this directly inside your Scaffold, right after your body closes!
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home_outlined, color: Color(0xff8A8A80), size: 28),
              Icon(Icons.bar_chart, color: Color(0xff8A8A80), size: 28),
              Icon(
                Icons.calendar_today_outlined,
                color: Color(0xff8A8A80),
                size: 26,
              ),
              Icon(Icons.settings_outlined, color: Color(0xff8A8A80), size: 28),
            ],
          ),
        ),
      ),
    );
  }
}
