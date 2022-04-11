import 'dart:io';
import 'package:flutter/material.dart';

// widget que tem a função de selecionar a foto e mostrar sua preview
class ImagePreviewWidget extends StatefulWidget {
  // duas funções definidas para selecionar imagem da galeria/câmera
  final Function() onCameraTap;
  final Function() onGalleryTap;
  // variável para armazenar a imagem de preview
  final File? previewImage;

  const ImagePreviewWidget(
      {Key? key,
      required this.onCameraTap,
      required this.onGalleryTap,
      this.previewImage})
      : super(key: key);

  @override
  State<ImagePreviewWidget> createState() => ImagePreviewWidgetState();
}

class ImagePreviewWidgetState extends State<ImagePreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return _ImagePickerOptionsWidget(
                onCameraTap: widget.onCameraTap,
                onGalleryTap: widget.onGalleryTap);
          },
        ),
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            child: widget.previewImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      widget.previewImage!,
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset('lib/assets/photo.png')),
      ),
    );
  }
}

class _ImagePickerOptionsWidget extends StatelessWidget {
  final Function() onCameraTap;
  final Function() onGalleryTap;
  const _ImagePickerOptionsWidget(
      {Key? key, required this.onCameraTap, required this.onGalleryTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text("Tirar foto"),
            onTap: onCameraTap),
        ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Escolha uma foto da biblioteca"),
            onTap: onGalleryTap)
      ],
    );
  }
}
