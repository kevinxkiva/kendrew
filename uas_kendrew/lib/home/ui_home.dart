// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kendrew/home/ui_detail_proyek.dart';
import 'package:uas_kendrew/themes/colors.dart';

import '../themes/floatingactionwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: CustomFAB(
        icon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.add,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () {},
              label: 'Tambah Proyek',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
          // FAB 2
          SpeedDialChild(
              child: const Icon(
                Icons.history,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () async {},
              label: 'History',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
        ],
      ),
      appBar: AppBar(
        backgroundColor: lightText,
        //diisi warna nek wes sesuai
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kendrew Tandiono",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Felmel@gmail.com",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 14),
            ),
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(360),
                ),
              ),
              child: Image.asset("lib/assets/images/defaultprofile.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
          ],
        ),
        //elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 35, 25, 30),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 6 / 3.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: darkText,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("lib/assets/images/back.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Proyek ABCD",
                            style: GoogleFonts.notoSans(
                              fontSize: 14,
                              color: darkText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          PopupMenuButton(
                              color: buttonColor,
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Text(
                                      "Done",
                                      style: GoogleFonts.notoSans(
                                        fontSize: 13,
                                        color: lightText,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Text(
                                      "Edit",
                                      style: GoogleFonts.notoSans(
                                        fontSize: 13,
                                        color: lightText,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (value) {}),
                        ],
                      ),
                      Text(
                        "Tommy Sulistyo",
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          color: darkText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
