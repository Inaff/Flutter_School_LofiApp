import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lofi_application/pages/jazz/jazz_page.dart';

class SongSelectPage extends StatefulWidget {
  const SongSelectPage({super.key});

  @override
  State<SongSelectPage> createState() => _SongSelectPageState();
}

class _SongSelectPageState extends State<SongSelectPage> {
  Widget SongClick() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(5))),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                  children: const [
                    TextSpan(text: '  R'),
                    TextSpan(
                      text: 'a',
                    ),
                    TextSpan(text: 'di'),
                    TextSpan(
                      text: 'o',
                    ),
                    TextSpan(text: ' Sel'),
                    TextSpan(
                      text: 'ec',
                    ),
                    TextSpan(text: 't'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Jazz_Page()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.pinkAccent),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(80),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: const [
                                TextSpan(text: 'J'),
                                TextSpan(
                                    text: 'a',
                                    style: TextStyle(color: Colors.pinkAccent)),
                                TextSpan(text: 'zz'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    height: 30,
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.pinkAccent),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: const [
                                TextSpan(text: 'L'),
                                TextSpan(
                                    text: 'o',
                                    style: TextStyle(color: Colors.pinkAccent)),
                                TextSpan(text: 'fi'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Jazz_Page()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.pinkAccent),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(80),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: const [
                                TextSpan(text: 'Sl'),
                                TextSpan(
                                    text: 'ee',
                                    style: TextStyle(color: Colors.pinkAccent)),
                                TextSpan(text: 'py'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    height: 30,
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.pinkAccent),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: const [
                                TextSpan(text: 'Ch'),
                                TextSpan(
                                    text: 'il',
                                    style: TextStyle(color: Colors.pinkAccent)),
                                TextSpan(text: 'l'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Jazz_Page()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.pinkAccent),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(80),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: const [
                                TextSpan(text: 'F'),
                                TextSpan(
                                    text: 'un',
                                    style: TextStyle(color: Colors.pinkAccent)),
                                TextSpan(text: 'k'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    height: 30,
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.pinkAccent),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: const [
                                TextSpan(text: 'C'),
                                TextSpan(
                                    text: 'l',
                                    style: TextStyle(color: Colors.pinkAccent)),
                                TextSpan(text: 'ass'),
                                TextSpan(
                                    text: 'ic',
                                    style: TextStyle(color: Colors.pinkAccent)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              speed: const Duration(seconds: 1),
              'LOFI APP',
              textStyle:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              colors: [
                Colors.pinkAccent,
                Colors.pink,
                Colors.tealAccent,
                Colors.blueAccent,
              ],
            ),
          ],
          repeatForever: true,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SongClick(),
    );
  }
}
