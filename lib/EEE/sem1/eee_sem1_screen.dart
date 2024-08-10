import 'package:flutter/material.dart';
import 'package:flutter_application_2/EEE/sem1/BEE/bee%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/BME/bme%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/ENGLISH/english%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/FEC/fec%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/FEC/fec.dart';
import 'package:flutter_application_2/EEE/sem1/IDEALAB/idealab%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/MATHS/maths%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/MATHS/maths.dart';
import 'package:flutter_application_2/EEE/sem1/BEE/bee.dart';
import 'package:flutter_application_2/EEE/sem1/BME/bme.dart';
import 'package:flutter_application_2/EEE/sem1/PHYSICS/physics%20-%20Copy.dart';
import 'package:flutter_application_2/EEE/sem1/PHYSICS/physics.dart';
import 'package:flutter_application_2/EEE/sem1/ENGLISH/english.dart';
import 'package:flutter_application_2/EEE/sem1/IDEALAB/idealab.dart';
import 'package:flutter_application_2/widgets/profiledark.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EEESem1Screen extends StatefulWidget {
  final String fullName;
  final String branch;
  final String year;
  final String semester;

  const EEESem1Screen({
    Key? key,
    required this.fullName,
    required this.branch,
    required this.year,
    required this.semester,
  }) : super(key: key);

  @override
  _EEESem1ScreenState createState() => _EEESem1ScreenState();
}

class _EEESem1ScreenState extends State<EEESem1Screen> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['Notes & Books', 'PYQs'];
  bool _isDarkMode = true;
  late Map<String, List<Map<String, dynamic>>> _subjects;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
    _initializeSubjects();
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? true;
    });
  }

  void _initializeSubjects() {
    _subjects = {
      'Notes & Books': [
        {
          'name': 'Calculus and Linear Algebra',
          'description': 'Study of calculus and linear algebra including...',
          'image': 'assets/s1.png',
          'page': () => maths(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Engineering Physics',
          'description': 'Exploration of fundamental concepts in physics...',
          'image': 'assets/s1.png',
          'page': () => physics(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Fundamentals of Electronics Engineering',
          'description': 'Basics of electronics and electrical engineering...',
          'image': 'assets/s1.png',
          'page': () => fec(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Technical English for Engineers',
          'description': 'Improving technical communication skills...',
          'image': 'assets/s1.png',
          'page': () => english(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'IDEA Lab Workshop',
          'description': 'Hands-on workshop focusing on innovative design...',
          'image': 'assets/s1.png',
          'page': () => idea(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Basics of Electrical Engineering',
          'description': 'Introduction to electrical engineering principles...',
          'image': 'assets/s1.png',
          'page': () => Bee(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Basic Mechanical Engineering',
          'description': 'Fundamental concepts in mechanical engineering...',
          'image': 'assets/s1.png',
          'page': () => bme(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
      ],
      'PYQs': [
        {
          'name': 'Calculus and Linear Algebra PYQs',
          'description': 'Previous Year Questions for Calculus and Linear Algebra...',
          'image': 'assets/s2.png',
          'page': () => maths1(fullName: widget.fullName ,branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Engineering Physics PYQs',
          'description': 'Previous Year Questions for Engineering Physics...',
          'image': 'assets/s2.png',
          'page': () => physics1(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Fundamentals of Electronics Engineering PYQs',
          'description': 'Previous Year Questions for Electronics Engineering...',
          'image': 'assets/s2.png',
          'page': () => fec1(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Technical English for Engineers PYQs',
          'description': 'Previous Year Questions for Technical English...',
          'image': 'assets/s2.png',
          'page': () => english1(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'IDEA Lab Workshop PYQs',
          'description': 'Previous Year Questions for IDEA Lab Workshop...',
          'image': 'assets/s2.png',
          'page': () => idea1(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Basics of Electrical Engineering PYQs',
          'description': 'Previous Year Questions for Electrical Engineering...',
          'image': 'assets/s2.png',
          'page': () => Bee1(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
        {
          'name': 'Basic Mechanical Engineering PYQs',
          'description': 'Previous Year Questions for Mechanical Engineering...',
          'image': 'assets/s2.png',
          'page': () => bme1(fullName: widget.fullName, branch: widget.branch, year: widget.year, semester: widget.semester),
        },
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return Scaffold(
      backgroundColor: _isDarkMode ? Color(0xFF4C4DDC) : Colors.blue[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(isPortrait ? 24.0 : 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey ${widget.fullName}',
                          style: TextStyle(
                              fontSize: isPortrait ? 24 : 20,
                              fontWeight: FontWeight.bold,
                              color: _isDarkMode ? Colors.white : Colors.blue[800]),
                        ),
                        Text(
                          'Select Subject',
                          style: TextStyle(fontSize: 16, color: _isDarkMode ? Colors.white70 : Colors.blue[600]),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            fullName: widget.fullName,
                            branch: widget.branch,
                            year: widget.year,
                            semester: widget.semester,
                            isDarkMode: _isDarkMode,
                            onThemeChanged: (bool newTheme) {
                              setState(() {
                                _isDarkMode = newTheme;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: _isDarkMode ? Colors.red[600] : Colors.blue[700],
                      radius: isPortrait ? 30 : 20,
                      child: Text(
                        widget.fullName[0].toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isPortrait ? 30 : 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _isDarkMode ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _isDarkMode ? Colors.black12 : Colors.blue.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _isDarkMode ? const Color.fromARGB(755, 58, 58, 58) : Colors.blue[50],
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: List.generate(
                            _tabs.length,
                            (index) => Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedIndex = index),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? (_isDarkMode ? Colors.black : Colors.white)
                                        : (_isDarkMode ? const Color.fromARGB(755, 58, 58, 58) : Colors.blue[50]),
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: _selectedIndex == index && !_isDarkMode
                                        ? [
                                            BoxShadow(
                                              color: Colors.blue.withOpacity(0.3),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: Text(
                                    _tabs[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _isDarkMode
                                          ? Colors.white
                                          : (_selectedIndex == index ? Colors.blue[800] : Colors.blue[600]),
                                      fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _subjects[_tabs[_selectedIndex]]!.length,
                        itemBuilder: (context, index) {
                          var subject = _subjects[_tabs[_selectedIndex]]![index];
                          return Card(
                            color: _isDarkMode ? const Color.fromARGB(755, 58, 58, 58) : Colors.white,
                            elevation: _isDarkMode ? 0 : 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              leading: subject['image'] != null
                                  ? Image.asset(subject['image'], width: 50, height: 50)
                                  : null,
                              title: Text(
                                subject['name'],
                                style: TextStyle(
                                  color: _isDarkMode ? Colors.white : Colors.blue[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                subject['description'],
                                style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.blue[600]),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => subject['page'](),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}