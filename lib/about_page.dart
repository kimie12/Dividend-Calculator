import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer_widget.dart';

class AboutPage extends StatelessWidget {
  // URL for your GitHub repo
  final String _githubUrl = 'https://github.com/kimie12/Dividend-Calculator.git';

  // Function to launch URL
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(_githubUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_githubUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.menu,
                    color: Colors.blueGrey[700],
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blueGrey[600],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'About',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/divi.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image, size: 100, color: Colors.grey[300]);
                  },
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Dividend Calculator\nVersion 1.0\n\nDeveloped by : MUHAMMAD HAKIMIE BIN AHMAD ZIKRI\nMatric number : 2023136019\n\nCourse :RCDCS251 5A\n\nSimply enter your investment amount, annual rate, and investment period to see your potential returns.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueGrey[700], fontSize: 16),
                      ),
                      SizedBox(height: 20),

                      // Clickable GitHub Link
                      GestureDetector(
                        onTap: _launchURL,
                        child: Text(
                          'GitHub Repository',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        '\u00a9 2025 MUHAMMAD HAKIMIE. All rights reserved.',
                        style: TextStyle(color: Colors.blueGrey[400], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
