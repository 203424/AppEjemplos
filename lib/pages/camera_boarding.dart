import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraBoarding extends StatefulWidget {
  const CameraBoarding({super.key});

  @override
  State<CameraBoarding> createState() => _CameraBoardingState();
}

class Prediction {
  late final String predict;
}

class _CameraBoardingState extends State<CameraBoarding> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = XFile(img!.path);
    });
  }

  Future<void> sendImage(BuildContext context) async {
    final bytes = await image!.readAsBytes();
    final dio = Dio();
    var respuesta = "";
    dio.options.baseUrl = 'http://192.168.89.114:8000/';
    //dio.options.headers['Authorization'] = 'Bearer your-token';

    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(bytes, filename: 'image.jpg'),
    });

    try {
      final response = await dio.post('api/v1/predecir/', data: formData);

      final respuesta = response.data;

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Respuesta'),
              content: Text('La fruta es: $respuesta'),
            );
          });
      return respuesta;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Respuesta'),
            content: Text('La fruta o verdura es: $respuesta'),
          );
        });
    // print(bytes);
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Escoge una opción'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('Seleccionar imagen de la galería'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('Tomar foto'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificador de frutas o verduras'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/logo.png'),
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFE0F7FA),
          Color(0xFFB2EBF2),
          Color(0xFF80DEEA),
          Color(0xFF4DD0E1),
          Color(0xFF26C6DA),
          Color(0xFF00BCD4),
          Color(0xFF00ACC1),
          Color(0xFF0097A7),
          Color(0xFF00838F),
          Color.fromARGB(255, 2, 74, 77),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 180, top: 50),
                child: Text(
                  "Identificador de frutas o verduras",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 74, 77),
                ),
                onPressed: () {
                  myAlert();
                },
                child: const Text('Subir imagen'),
              ),
              const SizedBox(
                height: 10,
              ),
              //if image not null show the image
              //if image null show text
              image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              sendImage(context);
                            },
                            child: const Text('Predecir fruta o verdura'),
                          ),
                        ],
                      ),
                    )
                  : const Text(
                      "No has subido una imagen",
                      style: TextStyle(fontSize: 20),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
