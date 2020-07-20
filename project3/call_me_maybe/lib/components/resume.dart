import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.9,
      child: ListView(
        children: <Widget>[],
      ),
    );
  }

  Widget listViewResumeRow(ResumeRow resume) {}
}

class ResumeRow {
  final String position;
  final String dateRange;
  final String company;
  final String details;

  ResumeRow({
    this.position = "N/A",
    this.dateRange = "mm/yy - mm/yy",
    this.company = "N/A",
    this.details = "N/A",
  });
}
