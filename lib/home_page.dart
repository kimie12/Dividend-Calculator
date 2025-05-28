// home_page.dart
import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _fundController = TextEditingController();
  final _rateController = TextEditingController();
  final _monthsController = TextEditingController();

  String _monthlyDividend = '';
  String _totalDividend = '';

  void _calculateDividend() {
    final fund = double.parse(_fundController.text);
    final rate = double.parse(_rateController.text);
    final months = int.parse(_monthsController.text);

    final monthlyDividend = (rate / 100 / 12) * fund;
    final totalDividend = monthlyDividend * months;

    setState(() {
      _monthlyDividend = monthlyDividend.toStringAsFixed(2);
      _totalDividend = totalDividend.toStringAsFixed(2);
    });
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
            'Home',  // or 'About' for AboutPage
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _fundController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Total Investment (RM)',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                            ),
                            validator: (value) => value!.isEmpty ? 'Enter amount' : null,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _rateController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Annual Interest Rate (%)',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                            ),
                            validator: (value) => value!.isEmpty ? 'Enter rate' : null,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _monthsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Months (1-12)',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return 'Enter months';
                              int? months = int.tryParse(value);
                              if (months == null || months < 1 || months > 12) return '1-12 only';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _calculateDividend();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Calculate Profits', style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 25),
                    if (_monthlyDividend.isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.green[50]!.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.green[200]!),
                        ),
                        child: Column(
                          children: [
                            Text('DIVIDEND RESULTS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800])),
                            SizedBox(height: 15),
                            _buildResultRow('Monthly:', 'RM $_monthlyDividend'),
                            SizedBox(height: 8),
                            _buildResultRow('Total:', 'RM $_totalDividend'),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
