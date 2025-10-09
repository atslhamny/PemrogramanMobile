import 'dart:async'; // Mengimpor library untuk menangani operasi asynchronous
import 'dart:convert'; // Mengimpor library untuk mengubah data (misalnya string ke list)
import 'package:audioplayers/audioplayers.dart'; // Package untuk memutar audio
import 'package:flutter/material.dart'; // Library utama Flutter untuk membuat UI
import 'package:flutter/services.dart'; // Untuk mengakses file dari assets (misalnya .lrc)

void main() {
  runApp(
    const MyApp(),
  ); // Menjalankan aplikasi dengan widget MyApp sebagai root
}
// Versi ribet pake banget heheheh :v
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Konstruktor konstanta untuk widget MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyric Player', // Judul aplikasi
      theme: ThemeData.dark(), // Tema aplikasi: dark mode
      home: const LyricPlayerPage(), // Halaman utama: LyricPlayerPage
      debugShowCheckedModeBanner:
          false, // Menyembunyikan banner "Debug" di pojok kanan atas
    );
  }
}

class LyricLine {
  final Duration time; // Waktu kapan lirik muncul
  final String text; // Isi teks lirik
  LyricLine({
    required this.time,
    required this.text,
  }); // Konstruktor dengan parameter wajib
}

class LyricPlayerPage extends StatefulWidget {
  const LyricPlayerPage({super.key}); // Konstruktor konstanta untuk halaman

  @override
  State<LyricPlayerPage> createState() => _LyricPlayerPageState(); // Membuat state untuk halaman
}

class _LyricPlayerPageState extends State<LyricPlayerPage> {
  final AudioPlayer _player = AudioPlayer(); // Pemutar audio
  final ScrollController _scrollController =
      ScrollController(); // Controller untuk scroll ListView
  final List<GlobalKey> _lyricKeys =
      []; // List GlobalKey untuk tiap baris lirik (agar bisa auto-scroll)

  List<LyricLine> _lyrics = []; // List yang berisi lirik
  Duration _duration = Duration.zero; // Durasi total lagu
  Duration _position = Duration.zero; // Posisi (waktu) audio saat ini
  bool _isPlaying = false; // Status apakah sedang play atau pause
  int _currentLyricIndex = 0; // Index lirik yang sedang aktif

  @override
  void initState() {
    super.initState(); // Memanggil init bawaan
    _loadLyrics(); // Memuat file lirik dari assets
    _player.onDurationChanged.listen((d) {
      // Mendengarkan perubahan durasi audio
      setState(() => _duration = d); // Update durasi total lagu
    });
    _player.onPositionChanged.listen((p) {
      // Mendengarkan perubahan posisi audio
      setState(() {
        _position = p; // Update posisi lagu
        _updateCurrentLyricIndex(); // Update lirik yang sedang aktif
      });
    });
    _player.onPlayerComplete.listen((_) {
      // Event ketika lagu selesai diputar
      setState(() {
        _isPlaying = false; // Status play jadi false
        _position = Duration.zero; // Reset posisi ke awal
        _currentLyricIndex = 0; // Reset ke lirik pertama
      });
    });
  }

  Future<void> _loadLyrics() async {
    final String lrc = await rootBundle.loadString(
      'assets/lyrics/multo.lrc',
    ); // Membaca file .lrc dari assets
    final lines = const LineSplitter().convert(
      lrc,
    ); // Memecah isi file jadi list per baris
    final List<LyricLine> parsed = []; // Tempat menyimpan hasil parsing

    final regExp = RegExp(
      r"\[(\d+):(\d+)\.(\d+)\](.*)",
    ); // Regex untuk ambil timestamp + teks lirik
    for (var line in lines) {
      // Loop tiap baris lrc
      final match = regExp.firstMatch(line); // Cek apakah baris sesuai format
      if (match != null) {
        final minutes = int.parse(match.group(1)!); // Ambil menit
        final seconds = int.parse(match.group(2)!); // Ambil detik
        final millis = int.parse(match.group(3)!) * 10; // Ambil milidetik
        final text = match.group(4)!.trim(); // Ambil teks lirik
        parsed.add(
          LyricLine(
            time: Duration(
              minutes: minutes,
              seconds: seconds,
              milliseconds: millis,
            ),
            text: text,
          ),
        );
      }
    }

    setState(() {
      _lyrics = parsed; // Simpan hasil parsing ke list _lyrics
      _lyricKeys.clear(); // Kosongkan list key
      _lyricKeys.addAll(
        List.generate(parsed.length, (_) => GlobalKey()),
      ); // Buat key untuk tiap lirik
    });
  }

  void _updateCurrentLyricIndex() {
    for (int i = 0; i < _lyrics.length; i++) {
      if (_position < _lyrics[i].time) {
        // Jika posisi sekarang < waktu lirik ke-i
        final newIndex = (i - 1).clamp(
          0,
          _lyrics.length - 1,
        ); // Index aktif adalah i-1

        if (newIndex != _currentLyricIndex) {
          // Jika index berubah
          setState(() {
            _currentLyricIndex = newIndex; // Update index aktif
          });

          // Scroll otomatis ke lirik aktif
          if (_lyricKeys.length > _currentLyricIndex) {
            final context = _lyricKeys[_currentLyricIndex].currentContext;
            if (context != null) {
              Scrollable.ensureVisible(
                context,
                duration: const Duration(
                  milliseconds: 400,
                ), // Animasi scroll 400ms
                curve: Curves.easeInOut, // Efek animasi
                alignment: 0.4, // Posisi lirik aktif di layar
              );
            }
          }
        }
        return; // Keluar dari loop
      }
    }

    _currentLyricIndex =
        _lyrics.length - 1; // Jika sudah di akhir lagu, set ke lirik terakhir
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      // Jika sedang play
      await _player.pause(); // Pause
    } else {
      await _player.play(
        AssetSource('audio/multo.mp3'),
      ); // Jika pause → play file audio
    }
    setState(() {
      _isPlaying = !_isPlaying; // Toggle status play/pause
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) =>
        n.toString().padLeft(2, '0'); // Format angka biar 2 digit
    final minutes = twoDigits(d.inMinutes.remainder(60)); // Ambil menit
    final seconds = twoDigits(d.inSeconds.remainder(60)); // Ambil detik
    return "$minutes:$seconds"; // Hasil format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lyric Player")), // AppBar dengan judul
      body: Column(
        children: [
          Slider(
            min: 0, // Nilai minimum slider
            max: _duration.inMilliseconds
                .toDouble(), // Nilai maksimum = total durasi lagu
            value: _position.inMilliseconds.toDouble().clamp(
              0,
              _duration.inMilliseconds.toDouble(),
            ), // Posisi slider sesuai waktu audio
            onChanged: (value) async {
              final seekPos = Duration(
                milliseconds: value.toInt(),
              ); // Hitung posisi baru
              await _player.seek(seekPos); // Geser audio ke posisi baru
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ), // Padding kiri-kanan
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Posisi teks kiri-kanan
              children: [
                Text(
                  _formatDuration(_position),
                ), // Menampilkan posisi audio saat ini
                Text(
                  _formatDuration(_duration),
                ), // Menampilkan total durasi audio
              ],
            ),
          ),
          const SizedBox(height: 20), // Jarak 20px
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Controller untuk scroll
              itemCount: _lyrics.length, // Jumlah item sesuai jumlah lirik
              itemBuilder: (context, index) {
                final isActive =
                    index == _currentLyricIndex; // Cek apakah lirik ini aktif
                return Padding(
                  key: _lyricKeys.length > index
                      ? _lyricKeys[index]
                      : null, // Tambahkan key untuk auto-scroll
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ), // Jarak antar lirik
                  child: Center(
                    child: Text(
                      _lyrics[index].text, // Teks lirik
                      style: TextStyle(
                        fontSize: isActive ? 30 : 20, // Lirik aktif lebih besar
                        fontFamily: 'Halvetica', // Font teks
                        fontWeight: isActive
                            ? FontWeight
                                  .bold // Lirik aktif ditebalkan
                            : FontWeight.normal,
                        color: isActive
                            ? Colors.pinkAccent
                            : Colors.white, // Lirik aktif warna pink
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(
              _isPlaying
                  ? Icons.pause_circle
                  : Icons.play_circle, // Ikon play/pause
              size: 64, // Ukuran ikon
            ),
            onPressed: _togglePlayPause, // Saat ditekan → play/pause
          ),
          const SizedBox(height: 16), // Jarak bawah
        ],
      ),
    );
  }
}
