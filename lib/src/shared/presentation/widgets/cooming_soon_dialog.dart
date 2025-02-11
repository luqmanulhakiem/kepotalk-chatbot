import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepotalk/src/core/data/datasources/theme_provider.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';
import 'package:provider/provider.dart';

Future<dynamic> coomingSoonDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

      return Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          isDarkMode ? Colors.transparent : Colors.transparent),
                      iconColor: WidgetStatePropertyAll(
                        isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Cooming Soon Feature",
                style: AppFont.generalSansSerif.copyWith(
                  color: isDarkMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Feature not ready yet.",
                style: AppFont.generalSans16.copyWith(
                  color: isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Exit",
                        style: AppFont.generalSans16.copyWith(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
