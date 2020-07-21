import 'package:flutter/material.dart';
import '../models/resumeRow.dart';

class Resume extends StatelessWidget {
  final List<ResumeRow> resumes = [
    ResumeRow(
        position: "Junior Software Developer",
        dateRange: "2019-Present",
        company: "Rough Country",
        location: "Dyersburg, TN",
        details:
            " I independently built applications with over 600 daily users. Other responsibilities include designing, building, managing, and testing web applications written using the MERN stack."),
    ResumeRow(
      position: "Sales Associate/Barista",
      dateRange: "2017-2019",
      company: "Davis Cookware",
      location: "Nashville, TN",
      details:
          "I developed, marketed and sold full range of culinary products, including kitchenware and coffee.",
    ),
    ResumeRow(
      position: "Water Line Techician",
      dateRange: "2014-2017",
      company: "Reed Hydro Jetting",
      location: "Dyersburg, TN",
      details:
          "I surveyed and generated water line blueprints of residential and commercial locations.",
    ),
    ResumeRow(
      position: "Barista Shift Lead",
      dateRange: "2013-2014",
      company: "Higher Ground",
      location: "Martin, TN",
      details:
          "Being the shift lead, I was responsible for managing the quality of coffee served, as well as the duties of other employees.",
    ),
    ResumeRow(
      position: "Grease Trap Cleaner",
      dateRange: "2011-2013",
      company: "DrainWorks",
      location: "Newbern, TN",
      details:
          "I cleaned grease traps across the northwest Tennessee area. Other duties involved managing a route, scheduling mandatory inspections with restaurants, and handling billing.",
    ),
    ResumeRow(
      position: "Quality Assurance Specialist",
      dateRange: "2010-2011",
      company: "JC Penny",
      location: "Dyersburg, TN",
      details:
          "I provided quality service at the counter to patrons of the store. My responsibilites involved assisting customers with purchases, handling returns, and assuring customer satisfaction.",
    ),
    ResumeRow(
      position: "Cashier",
      dateRange: "2011-2013",
      company: "Kroger",
      location: "Newbern, TN",
      details:
          "I provided quality service at the counter to patrons of the store.",
    ),
    ResumeRow(
      position: "Filler Data",
      dateRange: "2000-2000",
      company: "NotACompany",
      location: "Nowhere, AA",
      details:
          "This is a filler resume section for elongating the scrolling functionality.",
    ),
    ResumeRow(
      position: "Filler Data",
      dateRange: "2000-2000",
      company: "NotACompany",
      location: "Nowhere, AA",
      details:
          "This is a filler resume section for elongating the scrolling functionality.",
    )
  ];

  // Create resume row widgets
  @override
  Widget build(BuildContext context) {
    List<Widget> resumesList = resumeRowList(resumes);

    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.9,
      child: SingleChildScrollView(
        child: Column(
          children: resumesList,
        ),
      ),
    );
  }

  // Creates a widget list from a resume list
  List<Widget> resumeRowList(List<ResumeRow> resumes) {
    List<Widget> resumesList = [];
    resumes.forEach((resume) {
      resumesList.add(resumeRowWidget(resume));
    });

    return resumesList;
  }

  // Takes resume and returns a widget of the resume values
  Widget resumeRowWidget(ResumeRow resume) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          // Position title
          Text(resume.position,
              style: TextStyle(fontFamily: 'Rowdies-Light', fontSize: 20.0)),
          // Company, Time at Company, Company Location
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(resume.company,
                      style: TextStyle(
                          fontFamily: 'Rowdies-Light', fontSize: 12.0)),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(resume.dateRange,
                      style: TextStyle(
                          fontFamily: 'Rowdies-Light', fontSize: 12.0)),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(resume.location,
                      style: TextStyle(
                          fontFamily: 'Rowdies-Light', fontSize: 12.0)),
                ),
              ],
            ),
          ),
          // Position details
          Container(
            padding: EdgeInsets.only(top: 7),
            child: Text(resume.details),
          ),
        ],
      ),
    );
  }
}
