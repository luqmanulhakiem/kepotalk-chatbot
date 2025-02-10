import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';

class MenuButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const MenuButtonWidget({
    super.key,
    this.height,
    this.width,
    this.color,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.arrow_outward_rounded,
                  color: Colors.white,
                ),
              ],
            ),
            Text(
              label,
              style: AppFont.generalSansSerif.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
