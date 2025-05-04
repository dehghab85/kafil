import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nava/core/theme/app_pallete.dart';
import 'package:nava/core/utils.dart';
import 'package:nava/core/widget/custom_field.dart';
import 'package:nava/core/widget/loader.dart';
import 'package:nava/features/home/repositories/home_repsitory.dart';
import 'package:nava/features/home/viewmodel/home_viewmodel.dart';
import 'package:nava/features/home/widgets/audio_wave.dart';

class UploadSongPage extends ConsumerStatefulWidget {
  const UploadSongPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends ConsumerState<UploadSongPage> {
  final songNameController = TextEditingController();
  final artistNameController = TextEditingController();
  Color selectedColor = Pallete.cardColor;
  File? selectedImage;
  File? selectedAudio;
  final formkey = GlobalKey<FormState>();

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  void selectAudio() async {
    final pickedAudio = await pickAudio();
    if (pickedAudio != null) {
      setState(() {
        selectedAudio = pickedAudio;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    songNameController.dispose();
    artistNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(homeViewModelProvider.select((val) => val?.isLoading == true));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Song'),
        actions: [
          IconButton(
              onPressed: () async {
                if (formkey.currentState!.validate() &&
                    selectedAudio != null &&
                    selectedImage != null) {
                  ref.read(homeViewModelProvider.notifier).uploadSong(
                        selectedAudio: selectedAudio!,
                        selectedImage: selectedImage!,
                        songName: songNameController.text,
                        artist: artistNameController.text,
                        selectedColor: selectedColor,
                      );
                } else {
                  showSnackBar(context, 'missing fields');
                }
              },
              icon: const Icon(
                Icons.check,
              ))
        ],
      ),
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: selectImage,
                        child: selectedImage != null
                            ? Image.file(
                                selectedImage!,
                              )
                            : DottedBorder(
                                color: Pallete.borderColor,
                                radius: const Radius.circular(10),
                                borderType: BorderType.RRect,
                                dashPattern: const [10, 10],
                                strokeCap: StrokeCap.round,
                                child: const SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_open,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Select the thumbnaile for your song',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      selectedAudio != null
                          ? AudioWave(
                              path: selectedAudio!.path,
                            )
                          : CustomField(
                              hintText: 'Pick Song',
                              controller: null,
                              readOnly: true,
                              onTap: selectAudio,
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomField(
                          hintText: 'artist', controller: artistNameController),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomField(
                          hintText: 'song name',
                          controller: songNameController),
                      const SizedBox(
                        height: 20,
                      ),
                      ColorPicker(
                        color: selectedColor,
                        onColorChanged: (Color color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
