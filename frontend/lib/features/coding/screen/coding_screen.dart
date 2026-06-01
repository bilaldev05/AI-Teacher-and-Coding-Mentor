import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';

import '../model/coding_model.dart';
import '../service/coding_service.dart';

class CodingScreen extends StatefulWidget {

  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() =>
      _CodingScreenState();
}

class _CodingScreenState
    extends State<CodingScreen> {

  final languageController =
      TextEditingController();

  final problemController =
      TextEditingController();

  final CodingService service =
      CodingService();

  CodingModel? result;

  bool loading = false;

  Future<void> askAI() async {

    setState(() {
      loading = true;
    });

    try {

      final response =
          await service.askCoding(
        language:
            languageController.text,
        problem:
            problemController.text,
      );

      setState(() {
        result = response;
      });

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );

    } finally {

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("Coding Mentor"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            AppTextField(
              controller:
                  languageController,
              hint: "Programming Language",
            ),

            const SizedBox(height: 12),

            AppTextField(
              controller:
                  problemController,
              hint: "Describe coding problem",
              maxLines: 4,
            ),

            const SizedBox(height: 16),

            AppButton(
              text: "Ask Coding AI",
              loading: loading,
              onTap: askAI,
            ),

            const SizedBox(height: 20),

            if (result != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    result!.response,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}