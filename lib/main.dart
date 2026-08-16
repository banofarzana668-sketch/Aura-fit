import 'package:flutter/material.dart';

void main() {
  runApp(const AuraFitApp());
}

class AuraFitApp extends StatelessWidget {
  const AuraFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuraFit AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF080808),
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationWrapper(),
    );
  }
}

// ==========================================
// MAIN BOTTOM NAVIGATION WRAPPER (VIP RED GLOW DOCK)
// ==========================================
class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const FormCoachPage(),
    const MealScannerPage(),
    const MuscleBalancePage(),
    const BudgetMealSwapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          border: Border(top: BorderSide(color: const Color(0xFFFF1E27).withOpacity(0.4), width: 1.5)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF1E27).withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFF1E27),
          unselectedItemColor: Colors.white38,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.accessibility_new_rounded), label: 'Coach'),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFFF1E27),
                child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
              ),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.align_horizontal_center_rounded), label: 'Balance'),
            BottomNavigationBarItem(icon: Icon(Icons.restaurant_rounded), label: 'Swap'),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. DASHBOARD PAGE (EXACT DESIGN FROM IMAGE)
// ==========================================
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int glasses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFFFF1E27),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Home • Today', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          Text('Nov 16', style: TextStyle(color: Colors.white54, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_active_outlined, color: Colors.white),
                ],
              ),
              const SizedBox(height: 25),

              // Aura Avatar Ring
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFF1E27), width: 3),
                        boxShadow: [
                          BoxShadow(color: const Color(0xFFFF1E27).withOpacity(0.4), blurRadius: 30, spreadRadius: 5),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.bolt, color: Color(0xFFFF1E27), size: 80),
                        const Text('87%', style: TextStyle(fontSize: 32, fontWeight: FontWeight.black, color: Colors.white)),
                        const Text('STRENGTH', style: TextStyle(fontSize: 12, color: Colors.white70, letterSpacing: 2)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xFFFF1E27), borderRadius: BorderRadius.circular(10)),
                          child: const Text('Elite Level 12', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Water Tracker Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF141414),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.water_drop, color: Colors.lightBlueAccent, size: 20),
                            SizedBox(width: 8),
                            Text('Hydration', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                        Text('${((glasses / 12) * 100).toInt()}%', style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: (glasses / 12).clamp(0.0, 1.0),
                      backgroundColor: Colors.white10,
                      color: Colors.lightBlueAccent,
                      minHeight: 8,
                    ),
                    const SizedBox(height: 12),
                    Text('$glasses / 12 GLASSES (${(glasses * 0.25).toStringAsFixed(1)}L)', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF1E27), foregroundColor: Colors.white),
                            onPressed: () => setState(() => glasses = (glasses + 1).clamp(0, 12)),
                            child: const Text('+1 Glass'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF1E27), foregroundColor: Colors.white),
                            onPressed: () => setState(() => glasses = (glasses + 2).clamp(0, 12)),
                            child: const Text('+2 Glasses'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Bottom Stats Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.local_fire_department, color: Color(0xFFFF1E27)),
                          SizedBox(height: 8),
                          Text('Calories', style: TextStyle(color: Colors.white54, fontSize: 12)),
                          Text('1240', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('1240 kcal', style: TextStyle(color: Colors.white38, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.fitness_center, color: Color(0xFFFF1E27)),
                          SizedBox(height: 8),
                          Text('Workouts', style: TextStyle(color: Colors.white54, fontSize: 12)),
                          Text('4/5', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('This Week', style: TextStyle(color: Colors.white38, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. FORM & POSE COACH PAGE
// ==========================================
class FormCoachPage extends StatelessWidget {
  const FormCoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form & Pose Coach', style: TextStyle(color: Color(0xFFFF1E27), fontWeight: FontWeight.bold)), backgroundColor: Colors.black),
      body: Stack(
        children: [
          Center(
            child: Icon(Icons.accessibility_new, size: 250, color: const Color(0xFFFF1E27).withOpacity(0.8)),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFF1E27))),
                  child: Row(
                    children: const [
                      Icon(Icons.record_voice_over, color: Color(0xFFFF1E27)),
                      SizedBox(width: 10),
                      Expanded(child: Text('🔊 AI COACH: "Chest up karo, pau thode aage karein!"', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('FORM: GOOD ✓', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                      Text('REPS: 12/15', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. MEAL SCANNER PAGE (DIRECT INSTRUCTIONS)
// ==========================================
class MealScannerPage extends StatefulWidget {
  const MealScannerPage({super.key});

  @override
  State<MealScannerPage> createState() => _MealScannerPageState();
}

class _MealScannerPageState extends State<MealScannerPage> {
  int step = 0;
  final List<String> prompts = [
    "INSTRUCTION: Mix meal with spoon to reveal inner ingredients.",
    "INSTRUCTION: Show side angle of plate to measure depth & oil level.",
    "INSTRUCTION: Focus camera on green chilies, herbs & curry surface."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Meal Scanner', style: TextStyle(color: Color(0xFFFF1E27), fontWeight: FontWeight.bold)), backgroundColor: Colors.black),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFF1E27))),
              child: Row(
                children: [
                  const Icon(Icons.center_focus_weak, color: Color(0xFFFF1E27)),
                  const SizedBox(width: 10),
                  Expanded(child: Text(prompts[step], style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFFF1E27), width: 2)),
                child: const Icon(Icons.fastfood, size: 80, color: Color(0xFFFF1E27)),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF1E27), padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              onPressed: () {
                if (step < prompts.length - 1) {
                  setState(() => step++);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF141414),
                      title: const Text('⚡ NUTRITION BREAKDOWN', style: TextStyle(color: Color(0xFFFF1E27))),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Oil Detected: HIGH • 4.2g', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('• Calories: 620 kcal', style: TextStyle(color: Colors.white)),
                          Text('• Protein: 42g', style: TextStyle(color: Colors.white)),
                          Text('• Carbs: 56g', style: TextStyle(color: Colors.white)),
                          Text('• Fat: 18g', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('LOG MEAL', style: TextStyle(color: Color(0xFFFF1E27)))),
                      ],
                    ),
                  );
                }
              },
              child: Text(step < prompts.length - 1 ? 'NEXT STEP' : 'SCAN NOW', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. MUSCLE BALANCE SCANNER
// ==========================================
class MuscleBalancePage extends StatelessWidget {
  const MuscleBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Muscle Balance Scanner', style: TextStyle(color: Color(0xFFFF1E27), fontWeight: FontWeight.bold)), backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.accessibility, size: 200, color: Color(0xFFFF1E27)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Weak: Left Shoulder', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                  Text('Weak: Right Hamstring - 28%', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Balance Score: 62% → Target 80%+', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. BUDGET MEAL SWAP & TRANSFORMATION
// ==========================================
class BudgetMealSwapPage extends StatelessWidget {
  const BudgetMealSwapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget Meal Swap', style: TextStyle(color: Color(0xFFFF1E27), fontWeight: FontWeight.bold)), backgroundColor: Colors.black),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Cost Effective High Protein Swaps:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 15),
          _buildSwapCard('Sattu (Bhuna Chana)', '25g Protein', 'Rs 20', 'SAVE 40%'),
          _buildSwapCard('Anda (2 Eggs)', '12g Protein', 'Rs 15', 'SAVE 35%'),
          _buildSwapCard('Soya Chunks', '18g Protein', 'Rs 30', 'SAVE 30%'),
        ],
      ),
    );
  }

  Widget _buildSwapCard(String title, String protein, String price, String save) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(protein, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(color: Color(0xFFFF1E27), fontWeight: FontWeight.bold)),
              Text(save, style: const TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
