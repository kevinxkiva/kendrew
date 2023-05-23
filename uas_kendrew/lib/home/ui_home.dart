// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kendrew/home/service_home.dart';
import 'package:uas_kendrew/home/ui_detail_proyek.dart';
import 'package:uas_kendrew/themes/colors.dart';

import '../themes/floatingactionwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future getAllProyek;
  ServicesHome servicesUserHome = ServicesHome();

  @override
  void initState() {
    // TODO: implement initState
    getAllProyek = servicesUserHome.getProyek();
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuatProjekPage(),
                  ),
                );
              },
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
          child: FutureBuilder(
            future: getAllProyek,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List snapData = snapshot.data! as List;
                if (snapData[0] != 404) {
                  return ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: GridView.builder(
                      itemCount: snapData[1].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                builder: (context) => DetailPage(myId: snapData[1][index]['id_proyek'].toString(), myNamaProyek: snapData[1][index]['nama_proyek'].toString()),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: darkText,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "lib/assets/images/back.jpeg"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapData[1][index]['nama_proyek'],
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
                                    snapData[1][index]['penanggungjawab'].toString(),
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
                  );
                }
              }
              return Column();
            },
          )),
    );
  }
}

class BuatProjekPage extends StatefulWidget {
  const BuatProjekPage({super.key});

  @override
  State<BuatProjekPage> createState() => _BuatProjekPageState();
}

class _BuatProjekPageState extends State<BuatProjekPage> {
  final _controllerNamaProyek = TextEditingController();
  final _controllerLuasTanahProyek = TextEditingController();
  final _controllerJumlahLantaiProyek = TextEditingController();
  final _controllerNamaPenanggungJawabProyek = TextEditingController();

  ServicesHome servicesUserHome = ServicesHome();

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

  Future postProyek(
      id_user, nama_proyek, jumlah_lantai, luas_tanah, nama, context) async {
    var response = await servicesUserHome.inputProyek(
      id_user,
      nama_proyek,
      jumlah_lantai,
      luas_tanah,
      nama,
    );

    if (response[0] != 404) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response[1]),
        ),
      );
    }
  }

  TextFieldYa(text) {
    return TextField(
      readOnly: false,
      controller: text,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  TextFieldYa2(text) {
    return TextField(
      readOnly: false,
      controller: text,
      keyboardType: TextInputType.number,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightText,
          //diisi warna nek wes sesuai
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: darkText,
                      size: 50,
                    ),
                  ),
                ],
              ),
              Row(
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
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Nama Projek",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFieldYa(_controllerNamaProyek),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Jumlah Lantai",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFieldYa2(_controllerJumlahLantaiProyek),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Luas Tanah",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFieldYa2(_controllerLuasTanahProyek),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Penanggung Jawab",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFieldYa(_controllerNamaPenanggungJawabProyek),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_controllerNamaProyek.text != "" &&
                            _controllerJumlahLantaiProyek.text != "" &&
                            _controllerLuasTanahProyek.text != "" &&
                            _controllerNamaPenanggungJawabProyek.text != "") {
                          setState(() {
                            postProyek(
                                    "US001",
                                    _controllerNamaProyek.text,
                                    _controllerJumlahLantaiProyek.text,
                                    _controllerLuasTanahProyek.text,
                                    _controllerNamaPenanggungJawabProyek.text,
                                    context)
                                .then((value) {
                              _controllerNamaProyek.clear();
                              _controllerJumlahLantaiProyek.clear();
                              _controllerLuasTanahProyek.clear();
                              _controllerNamaPenanggungJawabProyek.clear();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            });
                          });
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.notoSans(
                          color: lightText,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
