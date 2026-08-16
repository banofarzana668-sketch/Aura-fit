import 'package:flutter/material.dart';

void main() {
  runApp(const AuraFitApp());
}

class AuraFitApp extends StatelessWidget {
  const AuraFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aura-Fit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0708),
        primaryColor: const Color(0xFF8B0000),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8B0000),
          secondary: Color(0xFFD32F2F),
          surface: Color(0xFF1E0E10),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _waterGlasses = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AURA-FIT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E0E10),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAlignment.start,
          children: [
            const Text(
              'Welcome Back, Athlete',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            
            // Feature Cards
            _buildCard('Form Coach AI', 'Analyze posture & reps', Icons.camera_alt, Colors.redAccent),
            const SizedBox(height: 12),
            _buildCard('Meal Scanner', 'Instant macro tracking', Icons.qr_code_scanner, Colors.deepOrangeAccent),
            const SizedBox(height: 20),

            // Water Tracker Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E0E10),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8B0000).withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Hydration Tracker', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('$_waterGlasses / 8 Glasses', style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_waterGlasses > 0) setState(() => _waterGlasses--);
                        },
                        icon: const Icon(Icons.remove_circle, color: Colors.grey),
                      ),
                      const Icon(Icons.local_drink, color: Colors.blueAccent, size: 36),
                      IconButton(
                        onPressed: () {
                          if (_waterGlasses < 12) setState(() => _waterGlasses++);
                        },
                        icon: const Icon(Icons.add_circle, color: Colors.redAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, IconData icon, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E0E10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: accentColor.withOpacity(0.2),
            child: Icon(icon, color: accentColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
