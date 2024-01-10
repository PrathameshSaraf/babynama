import 'package:flutter/material.dart';

import '../Model/vaccine_model.dart';




class VaccineTrackerPage extends StatefulWidget {
  @override
  _VaccineTrackerPageState createState() => _VaccineTrackerPageState();
}

class _VaccineTrackerPageState extends State<VaccineTrackerPage> {
  List<Vaccine> vaccines = [
    Vaccine(name: 'Vaccine 1', date: DateTime(2022, 1, 15), status: 'Completed'),
    Vaccine(name: 'Vaccine 2', date: DateTime(2022, 3, 20), status: 'Upcoming'),
    Vaccine(name: 'Vaccine 3', date: DateTime(2021, 12, 5), status: 'Past Due'),
    // Add more vaccines as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vaccination Tracker'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildVaccineCard(
                'Past due vaccines',
                vaccines.where((v) => v.status == 'Past Due').toList(),

              ),
              _buildVaccineCard(
                'Upcoming Doses',
                vaccines.where((v) => v.status == 'Upcoming').toList(),

              ),
              _buildVaccineCard(
                'Taken Doses',
                vaccines.where((v) => v.status == 'Completed').toList(),

              ),
              _buildVaccineCard(
                'All Vaccine Status',
                vaccines,

              ),
            ],
          ),
      )

      ),
    );
  }


  Widget _buildVaccineCard(String title, List<Vaccine> vaccineList) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Theme(
        data: ThemeData.light().copyWith(
          cardColor: Colors.white,
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          leading: Icon(
            Icons.medical_services,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          children: [
            Column(
              children: [
                for (var vaccine in vaccineList)
                  ListTile(
                    title: Text(
                      vaccine.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Date: ${vaccine.date.toString()}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: _buildStatusIndicator(vaccine.status),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String status) {
    IconData indicatorIcon;
    Color iconColor;

    switch (status) {
      case 'Completed':
        indicatorIcon = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case 'Upcoming':
        indicatorIcon = Icons.access_alarm;
        iconColor = Colors.blue;
        break;
      case 'Past Due':
        indicatorIcon = Icons.warning;
        iconColor = Colors.red;
        break;
      default:
        indicatorIcon = Icons.info;
        iconColor = Colors.grey;
    }

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200], // Gradient background
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          indicatorIcon,
          color: iconColor,
          size: 35,
        ),
      ),
    );
  }

}
