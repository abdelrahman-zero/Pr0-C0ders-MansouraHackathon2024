import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enhanced Professional App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF1E1E2C),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    PedigreeAnalysisPage(),
    AIDiseaseDetectorPage(),
    MarketSidePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color(0xFF252634),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom),
            label: 'Pedigree',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Disease Detector',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Market',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.deepOrange, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            'DERMA',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 4,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildFeatureCard(
                    context,
                    title: 'Pedigree Analysis',
                    subtitle: 'Analyze family trees and inheritance patterns.',
                    icon: Icons.family_restroom,
                    colors: [Colors.orange, Colors.deepOrange],
                    page: PedigreeAnalysisPage(),
                  ),
                  _buildFeatureCard(
                    context,
                    title: 'AI Disease Detector',
                    subtitle: 'Detect potential diseases with AI.',
                    icon: Icons.healing,
                    colors: [Colors.redAccent, Colors.pinkAccent],
                    page: AIDiseaseDetectorPage(),
                  ),
                  _buildFeatureCard(
                    context,
                    title: 'Market Side',
                    subtitle: 'Explore and manage market insights.',
                    icon: Icons.store,
                    colors: [Colors.purple, Colors.deepPurple],
                    page: MarketSidePage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required List<Color> colors,
      required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PedigreeAnalysisPage extends StatefulWidget {
  @override
  _PedigreeAnalysisPageState createState() => _PedigreeAnalysisPageState();
}

class _PedigreeAnalysisPageState extends State<PedigreeAnalysisPage> {
  final _formKey = GlobalKey<FormState>();

  // List of specific and professional questions
  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          "Does anyone in your immediate family (parents, siblings) have the same skin condition?",
      'key': 'immediateFamilyHistory',
      'options': ['Yes', 'No', 'Not Sure'],
      'answer': null,
    },
    {
      'question':
          "Does the skin condition appear more frequently in males, females, or equally in your family?",
      'key': 'genderPredominance',
      'options': ['Males', 'Females', 'Equal'],
      'answer': null,
    },
    {
      'question':
          "At what age do symptoms typically appear in affected family members?",
      'key': 'onsetAge',
      'options': [
        'Childhood (0-12 years)',
        'Adolescence (13-19 years)',
        'Adulthood (20+ years)',
        'Varies',
        'Not Sure'
      ],
      'answer': null,
    },
    {
      'question':
          "Have there been any instances of consanguineous (related by blood) marriages in your family?",
      'key': 'consanguineousMarriages',
      'options': ['Yes', 'No', 'Not Sure'],
      'answer': null,
    },
    {
      'question': "Does the skin condition skip generations in your family?",
      'key': 'skippedGenerations',
      'options': ['Yes', 'No', 'Not Sure'],
      'answer': null,
    },
    {
      'question':
          "Is the skin condition observed in every generation of your family?",
      'key': 'everyGeneration',
      'options': ['Yes', 'No', 'Not Sure'],
      'answer': null,
    },
  ];

  // Calculate likelihood percentage based on answers
  double _calculateLikelihoodPercentage() {
    int yesCount = _questions.where((q) => q['answer'] == 'Yes').length;
    return (yesCount / _questions.length) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedigree Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Family History Questions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ..._questions.map((q) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q['question'], style: TextStyle(fontSize: 16)),
                      ...q['options'].map<Widget>((option) {
                        return RadioListTile(
                          title: Text(option),
                          value: option,
                          groupValue: q['answer'],
                          onChanged: (value) {
                            setState(() {
                              q['answer'] = value;
                            });
                          },
                        );
                      }).toList(),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_questions.every((q) => q['answer'] != null)) {
                      double percentage = _calculateLikelihoodPercentage();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Analysis Result'),
                          content: Text(
                              'Likelihood of a genetic inheritance pattern: ${percentage.toStringAsFixed(1)}%'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please answer all questions.'),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AIDiseaseDetectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Disease Detector')),
      body: Center(
        child: Text(
          'Welcome to the AI Disease Detector Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class MarketSidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Market Side')),
      body: Center(
        child: Text(
          'Welcome to the Market Side Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
