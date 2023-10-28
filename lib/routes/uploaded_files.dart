import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resumify/client/client.dart';
import 'package:resumify/routes/widgets/uploaded_list.dart';

class UploadedFiles extends StatefulWidget {
  final List<String> pathList;
  const UploadedFiles({super.key, required this.pathList});

  @override
  State<UploadedFiles> createState() => _UploadedFilesState();
}

class _UploadedFilesState extends State<UploadedFiles> {
  String? jobId;

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
    return Scaffold(
      backgroundColor: Colors.white,
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
            FutureBuilder<String?>(
              future: client.queueMultipleFileJob(widget.pathList),
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot ftrSnapshot) {
                String status = "Uploading";

                if (ftrSnapshot.connectionState == ConnectionState.done) {
                  status = "Uploading";
                } else if (ftrSnapshot.hasError) {
                  status = "Uploading failed";
                }

                if (ftrSnapshot.hasData) {
                  jobId = ftrSnapshot.data;
                }

                return StreamBuilder<Map<String, dynamic>?>(
                    stream: client.getJobStatusStream("asds"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        status = "Parsing";
                      } else if (snapshot.hasError) {
                        status = "Parsing failed.";
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        status = "Done";
                      }
                      return Column(
                        children: widget.pathList
                            .map(
                              (filePath) => Uploadedlist(
                                filename: File(filePath).uri.pathSegments.last,
                                status: status,
                              ),
                            )
                            .toList(),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
