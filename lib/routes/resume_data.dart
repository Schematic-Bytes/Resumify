import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumify/routes/widgets/build_chip.dart';
import 'package:timelines/timelines.dart';

Map data = {
  "name": "Arun Babu",
  "sex": "Male",
  "email": "arun@gmail.com",
  "phone No": 1234567890,
  "location": "Kerala",
  "github_main_page_url": "https://github.com/arunbabuvn",
  "linkedin_url": "www.linkedin.com/in/arunbabuvn",
  "GPA": 8.6,
  "education_level": "B Tech",
  "graduation_year": 2024,
  "graduation_month": null,
  "majors": "Computer Science and Engineering (CSE)",
  "university": "Rajeev Gandhi Memorial College of Engineering and Technology, Nandayl",
  "project_experience": [
    {
      "project_description":
          "Developed a professional looking portfolio website, host this website in online using AWS servers",
      "project_name": "Personal Portfolio",
    },
    {
      "project_description":
          "Created a URL shortener using famous python framework Flask, and deployed this app In local machine and successfully converted long URL into short,This shortener URL is Available till the app server is running",
      "project_name": "URL shortener"
    }
  ],
  "work_experience": [],
};

class ResumeData extends StatelessWidget {
  const ResumeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Details",
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: data["sex"] == "Male"
                  ? SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/memoji-male.png"),
                    )
                  : SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/memoji-female.png"),
                    ),
            ),
            Center(
              child: Text(
                "${data["name"]}",
                style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  buildChip("${data["email"]}", "gmail.svg"),
                  buildChip("${data["sex"]}", (data["sex"] == "Male" ? "male.svg" : "female.svg")),
                  buildChip("${data["phone No"]}", "phone.svg"),
                  buildChip("${data["linkedin_url"].split("/").last}", "linked.svg"),
                  buildChip("${data["location"]}", "location.svg"),
                  buildChip("${data["github_main_page_url"].split("/").last}", "github.svg"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Education",
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            TimelineTile(
              contents: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data["university"]}",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${data["graduation_year"] - 3} - ${data["graduation_year"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                    Text(
                      "${data["majors"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                    Text(
                      "${data["GPA"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ],
                ),
              ),
              nodeAlign: TimelineNodeAlign.start,
              node: const TimelineNode(
                indicator: DotIndicator(),
                endConnector: SolidLineConnector(),
              ),
            ),
            TimelineTile(
              contents: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data["university"]}",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${data["graduation_year"] - 3} - ${data["graduation_year"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                    Text(
                      "${data["majors"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                    Text(
                      "${data["GPA"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ],
                ),
              ),
              nodeAlign: TimelineNodeAlign.start,
              node: const TimelineNode(
                indicator: DotIndicator(),
                startConnector: SolidLineConnector(),
                // endConnector: SolidLineConnector(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Experience",
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            TimelineTile(
              contents: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data["project_experience"][0]["project_name"]}",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${data["project_experience"][0]["project_description"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ],
                ),
              ),
              nodeAlign: TimelineNodeAlign.start,
              node: const TimelineNode(
                indicator: DotIndicator(),
                endConnector: SolidLineConnector(),
              ),
            ),
            TimelineTile(
              contents: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data["project_experience"][1]["project_name"]}",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
                      // overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${data["project_experience"][1]["project_description"]}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ],
                ),
              ),
              nodeAlign: TimelineNodeAlign.start,
              node: const TimelineNode(
                indicator: DotIndicator(),
                startConnector: SolidLineConnector(),
                // endConnector: SolidLineConnector(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
