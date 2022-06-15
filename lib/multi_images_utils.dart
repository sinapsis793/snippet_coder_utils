library snippetcoder_utils;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImagePickSource {
  /// Opens up the device camera, letting the user to take a new picture.
  camera,

  /// Opens the user's photo gallery.
  gallery,
}

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  String imageFile;
  String? imageUrl;

  ImageUploadModel({
    required this.isUploaded,
    required this.uploading,
    required this.imageFile,
    this.imageUrl,
  });
}

class MultiImagePicker extends StatefulWidget {
  const MultiImagePicker({
    required this.totalImages,
    required this.onImageChanged,
    this.initialValue,
    this.imageSource = ImagePickSource.gallery,
  });

  final int totalImages;
  final ValueChanged<dynamic> onImageChanged;
  final List<String>? initialValue;
  final ImagePickSource imageSource;

  @override
  _MultiImagePickerState createState() => _MultiImagePickerState();
}

class _MultiImagePickerState extends State<MultiImagePicker> {
  List<Object> images = List<Object>.empty(growable: true);
  late Future<PickedFile?> _imageFile;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < this.widget.totalImages; i++) {
      images.add("Add Image");
    }

    if (this.widget.initialValue!.length > 0) {
      for (var i = 0; i < this.widget.initialValue!.length; i++) {
        ImageUploadModel imageUpload = new ImageUploadModel(
          isUploaded: false,
          uploading: false,
          imageFile: '',
          imageUrl: this.widget.initialValue![i],
        );

        images.replaceRange(i, i + 1, [imageUpload]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildGridView();
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index] as ImageUploadModel;
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                uploadModel.imageUrl == null
                    ? Image.file(
                        File(uploadModel.imageFile),
                        width: 300,
                        height: 300,
                      )
                    : Image.network(
                        uploadModel.imageUrl ?? "",
                        width: 300,
                        height: 300,
                      ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                        _handleChanged();
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  Future _onAddImageClick(int index) async {
    ImagePicker _picker = new ImagePicker();
    setState(() {
      _imageFile = _picker.getImage(
        source: this.widget.imageSource == ImagePickSource.gallery
            ? ImageSource.gallery
            : ImageSource.camera,
      );
      getFileImage(index);
    });
  }

  void getFileImage(int index) async {
    _imageFile.then((file) async {
      if (file != null) {
        setState(() {
          ImageUploadModel imageUpload = new ImageUploadModel(
            isUploaded: false,
            uploading: false,
            imageFile: file.path,
            imageUrl: null,
          );

          images.replaceRange(index, index + 1, [imageUpload]);

          _handleChanged();
        });
      }
    });
  }

  void _handleChanged() {
    widget.onImageChanged(images);
  }
}
