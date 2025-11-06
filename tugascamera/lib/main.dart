import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(CameraApp(cameras: cameras));
}

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraApp({super.key, required this.cameras});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int selectedCameraIndex = 0;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _initCamera(widget.cameras[selectedCameraIndex]);
  }

  void _initCamera(CameraDescription cameraDescription) {
    _controller = CameraController(cameraDescription, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  void _switchCamera() {
    if (widget.cameras.length < 2) return;
    selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
    _initCamera(widget.cameras[selectedCameraIndex]);
    setState(() {});
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final picture = await _controller.takePicture();

      // 📂 Path penyimpanan manual (pastikan folder ini ada!)
      final saveDir =
          r'D:\KULIAH\05 SMT 5 PERKULIAHAN\00 PEMOB\JOBSHEET\DART\tugascamera\image';

      // Buat nama file unik
      final name = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = join(saveDir, name);

      // Simpan hasil foto
      await picture.saveTo(path);

      // Update UI
      if (mounted) {
        setState(() {
          imagePath = path;
        });

        // Tampilkan notifikasi SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('📸 Foto tersimpan di: $path'),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      print("❌ Gagal mengambil foto: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal mengambil foto!')));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text('Camera App')),
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(child: CameraPreview(_controller)),
                  if (imagePath != null)
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Path: $imagePath',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Image.file(
                          File(imagePath!),
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _switchCamera,
                        icon: const Icon(Icons.cameraswitch),
                        label: const Text('Ganti Kamera'),
                      ),
                      ElevatedButton.icon(
                        onPressed: _takePicture,
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Ambil Foto'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
