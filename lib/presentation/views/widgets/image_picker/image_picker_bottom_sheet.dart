import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/theme/theme.dart';
import '../../../../core/constants/app_images.dart';

class ImagePickerBottomSheet {
  static Future<String?> show(BuildContext context, WidgetRef ref) async {
    final themeMode = ref.watch(themeProvider);
    final ImagePicker picker = ImagePicker();
    String? selectedImagePath;

    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Add a photo',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(),
              ListTile(
                leading: themeMode == ThemeMode.light
                    ? Image.asset(
                        AppImages.galleryLogo,
                        width: 28,
                        height: 28,
                      )
                    : Image.asset(
                        AppImages.galleryLogoDark,
                        width: 28,
                        height: 28,
                      ),
                title: const Text('Gallery'),
                subtitle: const Text('Choose from gallery'),
                onTap: () async {
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    selectedImagePath = image.path;
                  }
                  if (context.mounted) Navigator.pop(context);
                },
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: themeMode == ThemeMode.light
                    ? Image.asset(
                        AppImages.cameraLogo,
                        width: 28,
                        height: 28,
                      )
                    : Image.asset(
                        AppImages.cameraLogoDark,
                        width: 28,
                        height: 28,
                      ),
                title: const Text('Camera'),
                subtitle: const Text('Take a new photo'),
                onTap: () async {
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    selectedImagePath = image.path;
                  }
                  if (context.mounted) Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );

    return selectedImagePath;
  }
}
