import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumify/routes/widgets/uploaded_list.dart';

class UploadedFiles extends StatelessWidget {
  const UploadedFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Text(
                "Parsed Files",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text("Tap to preview your files"),
            ),
            const Column(
              children: [
                Uploadedlist(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
