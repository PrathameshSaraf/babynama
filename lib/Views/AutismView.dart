import 'package:babynama/viewModel/AutismviewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/app_text.dart';

class AutismView extends StatelessWidget {
  const AutismView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AutismViewModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: AppText('Autism Detection', context)
                .heading5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 250),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                  children: [
                    AppText(
                      viewmodel.questions[viewmodel.currentQuestionIndex],
                      context,
                    ).heading3,
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              viewmodel.answerQuestion('Yes', context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: AppText('Yes', context,
                              color: Colors.white)
                              .bodyMedium,
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () =>
                              viewmodel.answerQuestion('No', context),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: AppText("No", context,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white)
                              .bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
