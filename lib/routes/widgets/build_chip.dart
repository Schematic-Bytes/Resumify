import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildChip(var title, var image) {
  return Container(
    margin: const EdgeInsets.only(left: 5),
    child: Chip(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: const BorderSide(width: 2)),
      avatar: SvgPicture.asset("assets/images/$image"),
      label: Text(
        "$title",
        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
