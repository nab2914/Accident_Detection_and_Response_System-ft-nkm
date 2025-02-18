import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:animations/animations.dart';
import 'currentlocation.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("System Monitoring"),
        backgroundColor: Colors.lightBlueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue.shade100,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade300,
                ),
                child: const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('User'),
                onTap: () {
                  Navigator.pushNamed(context, '/user');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    Icon(
                      LucideIcons.activity,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'System Monitoring',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Status: Active',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              OpenContainer(
                closedElevation: 0,
                openElevation: 0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                openBuilder: (context, _) => const Placeholder(),
                closedBuilder: (context, openContainer) => ElevatedButton.icon(
                  onPressed: openContainer,
                  icon: const Icon(LucideIcons.alertTriangle),
                  label: const Text('Report Accident'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OpenContainer(
                closedElevation: 0,
                openElevation: 0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                openBuilder: (context, _) => const Placeholder(),
                closedBuilder: (context, openContainer) => ElevatedButton.icon(
                  onPressed: openContainer,
                  icon: const Icon(LucideIcons.phoneCall),
                  label: const Text('Call Services'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OpenContainer(
                closedElevation: 0,
                openElevation: 0,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                openBuilder: (context, _) => const Placeholder(),
                closedBuilder: (context, openContainer) => ElevatedButton.icon(
                  onPressed: () {
            // Navigate to CurrentLocationPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CurrentLocationPage()),
            );
          },
                  icon: const Icon(LucideIcons.mapPin),
                  label: const Text('Current Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System Monitoring"),
        backgroundColor: Colors.lightBlueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue.shade100,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade300,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User'),
                onTap: () {
                  Navigator.pushNamed(context, '/user');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'System Monitoring',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle accident report
                },
                icon: Icon(Icons.report),
                label: Text('Report Accident'),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle call services
                },
                icon: Icon(Icons.call),
                label: Text('Call Services'),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle current location
                },
                icon: Icon(Icons.location_on),
                label: Text('Current Location'),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/