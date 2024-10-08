import 'package:flutter/material.dart';
import 'package:flutter_application_2/CIVIL/sem3/CED/ced.dart';
import 'package:flutter_application_2/CIVIL/sem3/EG/eg.dart';
import 'package:flutter_application_2/CIVIL/sem3/LSPE/lspe.dart';
import 'package:flutter_application_2/CIVIL/sem3/MS/ms.dart';
import 'package:flutter_application_2/CIVIL/sem3/MSE/mse.dart';
import 'package:flutter_application_2/CIVIL/sem3/PDCA/pdca.dart';
import 'package:flutter_application_2/CIVIL/sem3/SAG/sag.dart';
import 'package:flutter_application_2/CIVIL/sem3/units.dart'; // Import the correct file for units
import 'package:flutter_application_2/widgets/profile.dart'; // Import the profile.dart file

class CIVILSem3Screen extends StatefulWidget {
  final String fullName;
  final String branch;
  final String year;
  final String semester;

  const CIVILSem3Screen({//n
    Key? key,
    required this.fullName,
    required this.branch,
    required this.year,
    required this.semester,
  }) : super(key: key);

  @override
  _CIVILSem3ScreenState createState() => _CIVILSem3ScreenState();
}

class _CIVILSem3ScreenState extends State<CIVILSem3Screen> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['Notes & Books', 'PYQs'];

  late Map<String, List<Map<String, dynamic>>> _subjects;

  @override
  void initState() {
    super.initState();

    _subjects = {
      'Notes & Books': [
        {
          'name': 'Probability Distributions and Complex Analysis',
          'description':
              'Study of probability distributions and complex analysis...',
          'image': 'assets/s1.png',
          'page': () => pdca(fullName: widget.fullName),
        },
        {
          'name': 'Material Science and Engineering',
          'description':
              'Exploration of material science and engineering concepts...',
          'image': 'assets/s1.png',
          'page': () => mse(fullName: widget.fullName),
        },
        {
          'name': 'Mechanics of Solids',
          'description': 'Introduction to mechanics of solids...',
          'image': 'assets/s1.png',
          'page': () => ms(fullName: widget.fullName),
        },
        {
          'name': 'Surveying and Geomatics',
          'description': 'Fundamentals of surveying and geomatics...',
          'image': 'assets/s1.png',
          'page': () => sag(fullName: widget.fullName),
        },
        {
          'name': 'Engineering Geology',
          'description': 'Introduction to engineering geology principles...',
          'image': 'assets/s1.png',
          'page': () => eg(fullName: widget.fullName),
        },
        {
          'name': 'Life Skills and Professional Ethics',
          'description': 'Study of life skills and professional ethics...',
          'image': 'assets/s1.png',
          'page': () => lspe(fullName: widget.fullName),
        },
        {
          'name': 'Civil Engineering Drawing',
          'description': 'Introduction to civil engineering drawing...',
          'image': 'assets/s1.png',
          'page': () => ced(fullName: widget.fullName),
        },
      ],
      'PYQs': [
        {
          'name': 'Probability Distributions and Complex Analysis PYQs',
          'description':
              'Previous Year Questions for Probability Distributions and Complex Analysis...',
          'image': 'assets/s2.png',
          'page': () => pdca(fullName: widget.fullName),
        },
        {
          'name': 'Material Science and Engineering PYQs',
          'description':
              'Previous Year Questions for Material Science and Engineering...',
          'image': 'assets/s2.png',
          'page': () => mse(fullName: widget.fullName),
        },
        {
          'name': 'Mechanics of Solids PYQs',
          'description': 'Previous Year Questions for Mechanics of Solids...',
          'image': 'assets/s2.png',
          'page': () => ms(fullName: widget.fullName),
        },
        {
          'name': 'Surveying and Geomatics PYQs',
          'description':
              'Previous Year Questions for Surveying and Geomatics...',
          'image': 'assets/s2.png',
          'page': () => sag(fullName: widget.fullName),
        },
        {
          'name': 'Engineering Geology PYQs',
          'description': 'Previous Year Questions for Engineering Geology...',
          'image': 'assets/s2.png',
          'page': () => eg(fullName: widget.fullName),
        },
        {
          'name': 'Life Skills and Professional Ethics PYQs',
          'description':
              'Previous Year Questions for Life Skills and Professional Ethics...',
          'image': 'assets/s2.png',
          'page': () => lspe(fullName: widget.fullName),
        },
        {
          'name': 'Civil Engineering Drawing PYQs',
          'description':
              'Previous Year Questions for Civil Engineering Drawing...',
          'image': 'assets/s2.png',
          'page': () => ced(fullName: widget.fullName),
        },
      ],
    };
  }

 @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(755, 7, 17, 148),
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
                              color: Colors.white),
                        ),
                        const Text(
                          'Select Subject',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
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
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red[600],
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
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 24),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(755, 58, 58, 58),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: List.generate(
                            _tabs.length,
                            (index) => Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _selectedIndex = index),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? Colors.black
                                        : const Color.fromARGB(755, 58, 58, 58),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    _tabs[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
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
                          var subject =
                              _subjects[_tabs[_selectedIndex]]![index];
                          return Card(
                            color: const Color.fromARGB(755, 58, 58, 58),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8),
                              leading: subject['image'] != null
                                  ? Image.asset(subject['image'],
                                      width: 50, height: 50)
                                  : null,
                              title: Text(subject['name'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(subject['description'],
                                  style:
                                      const TextStyle(color: Colors.white70)),
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