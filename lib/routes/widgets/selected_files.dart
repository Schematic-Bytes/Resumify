import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumify/routes/Resume_data.dart';

class SelectedFiles extends StatelessWidget {
  final String filename;
  const SelectedFiles({super.key, required this.filename});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(246, 246, 246, 1)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/pdf.png"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        filename,
                        style: GoogleFonts.inter(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "(Uploaded)",
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResumeData()),
        );
      },
    );
  }
}
