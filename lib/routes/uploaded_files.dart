import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumify/routes/widgets/uploaded_list.dart';

class UploadedFiles extends StatefulWidget {
  final List<String> pathList;
  const UploadedFiles({super.key, required this.pathList});

  @override
  State<UploadedFiles> createState() => _UploadedFilesState();
}

class _UploadedFilesState extends State<UploadedFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Text(
                "Parsed Files",
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text("Tap to preview your files"),
            ),
            const Column(
              children: [
                Uploadedlist(
                  filename: "Asasa",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
