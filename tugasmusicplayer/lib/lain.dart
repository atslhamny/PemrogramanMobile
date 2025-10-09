import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Versi Sederhana

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Multo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            width: 350, // biar ga full layar
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              // 🔥 supaya bisa di scroll
              child: const Text(
                '''
Humingang malalim, pumikit na muna
At baka-sakaling namamalikmata lang
Ba't nababahala? 'Di ba't ako'y mag-isa?
'Kala ko'y payapa, boses mo'y tumatawag pa
Binaon naman na ang lahat
Tinakpan naman na 'king sugat
Ngunit ba't ba andito pa rin?
Hirap na 'kong intindihin
Tanging panalangin, lubayan na sana
Dahil sa bawat tingin, mukha mo'y nakikita
Kahit sa'n man mapunta ay anino mo'y kumakapit sa 'king kamay
Ako ay dahan-dahang nililibing nang buhay pa
Hindi na makalaya
Dinadalaw mo 'ko bawat gabi
Wala mang nakikita
Haplos mo'y ramdam pa rin sa dilim
Hindi na nananaginip
Hindi na ma-makagising
Pasindi na ng ilaw
Minumulto na 'ko ng damdamin ko
Ng damdamin ko
Hindi mo ba ako lilisanin?
Hindi pa ba sapat pagpapahirap sa 'kin? (Damdamin ko)
Hindi na ba ma-mamamayapa?
Hindi na ba ma-mamamayapa?
Hindi na makalaya
Dinadalaw mo 'ko bawat gabi
Wala mang nakikita
Haplos mo'y ramdam pa rin sa dilim
Hindi na nananaginip
Hindi na ma-makagising
Pasindi na ng ilaw
Minumulto na 'ko ng damdamin ko
Ng damdamin ko
Hindi mo ba ako lilisanin? (Makalaya)
(Dinadalaw mo 'ko bawat gabi) hindi pa ba sapat pagpapahirap sa 'kin?
(Wala mang nakikita) hindi na ba ma-mamamayapa?
(Haplos mo'y ramdam pa rin sa dilim) hindi na ba ma-mamamayapa?
                ''',
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify, // rata kanan-kiri
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
