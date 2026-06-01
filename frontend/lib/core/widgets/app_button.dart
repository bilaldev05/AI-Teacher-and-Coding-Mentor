import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  final bool loading;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      width: double.infinity,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primary,

          padding:
              const EdgeInsets.symmetric(
            vertical: 16,
          ),

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(14),
          ),
        ),

        onPressed:
            loading ? null : onTap,

        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child:
                    CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
      ),
    );
  }
}