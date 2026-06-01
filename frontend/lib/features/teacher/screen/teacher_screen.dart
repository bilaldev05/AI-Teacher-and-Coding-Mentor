import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';

import '../model/teacher_model.dart';
import '../service/teacher_service.dart';

class TeacherScreen extends StatefulWidget {

  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() =>
      _TeacherScreenState();
}

class _TeacherScreenState
    extends State<TeacherScreen> {

  final subjectController =
      TextEditingController();

  final questionController =
      TextEditingController();

  final TeacherService service =
      TeacherService();

  TeacherModel? result;

  bool loading = false;

  Future<void> askAI() async {

    setState(() {
      loading = true;
    });

    try {

      final response =
          await service.askTeacher(
        subject:
            subjectController.text,
        question:
            questionController.text,
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
            const Text("Teacher Assistant"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            AppTextField(
              controller:
                  subjectController,
              hint: "Subject",
            ),

            const SizedBox(height: 12),

            AppTextField(
              controller:
                  questionController,
              hint: "Ask question",
              maxLines: 4,
            ),

            const SizedBox(height: 16),

            AppButton(
              text: "Ask Teacher AI",
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