import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/feedback/feedback_bloc.dart';
import 'package:help_mee/presentation/screens/settings/feedback_screen/widgets/fb_button.dart';
import 'package:help_mee/presentation/screens/settings/feedback_screen/widgets/fb_check_line.dart';
import 'package:help_mee/presentation/screens/settings/feedback_screen/widgets/fb_fields.dart';
import 'package:help_mee/presentation/screens/settings/feedback_screen/widgets/fb_text_and_arrow_back.dart';
import 'package:help_mee/util/constants/app_size.dart';

class FeedbackScreen extends StatefulWidget {
  static const path = '/feedback-screen';
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  late TextEditingController firstNameController,
      lastNameController,
      emailController,
      phoneNoController,
      subjectController,
      messageController;
  final GlobalKey<FormFieldState> firstNameKey = GlobalKey<FormFieldState>(),
      lastNameKey = GlobalKey<FormFieldState>(),
      emailKey = GlobalKey<FormFieldState>(),
      phoneNoKey = GlobalKey<FormFieldState>(),
      subjectKey = GlobalKey<FormFieldState>(),
      messageKey = GlobalKey<FormFieldState>();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNoController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedbackBloc, FeedbackState>(
      listener: _handleFeedbackListener,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FbArrowBack(),
                SizedBox(height: AppSize.instance.height * 0.02),
                FbText(),
                SizedBox(height: AppSize.instance.height * 0.02),
                FbFields(
                  firstNameController: firstNameController,
                  firstNameKey: firstNameKey,
                  lastNameController: lastNameController,
                  lastNameKey: lastNameKey,
                  emailController: emailController,
                  emailKey: emailKey,
                  phoneNoController: phoneNoController,
                  phoneNoKey: phoneNoKey,
                  subjectController: subjectController,
                  subjectKey: subjectKey,
                  messageController: messageController,
                  messageKey: messageKey,
                ),
                SizedBox(height: AppSize.instance.height * 0.01),
                FbCheckLine(
                  isChecked: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                SizedBox(height: AppSize.instance.height * 0.01),
                FbButton(
                  onPressed: () {
                    if (firstNameKey.currentState?.validate() != true) return;
                    if (lastNameKey.currentState?.validate() != true) return;
                    if (subjectKey.currentState?.validate() != true) return;
                    if (messageKey.currentState?.validate() != true) return;
                    if (!isChecked) {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content: Text(
                              AppLocalizations.of(
                                context,
                              )!.errorAcceptPrivacyPolicy,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                    context.read<FeedbackBloc>().add(
                      SendFeedbackEvent(
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        email: emailController.text.trim(),
                        phoneNo: phoneNoController.text.trim(),
                        subject: subjectController.text.trim(),
                        message: messageController.text.trim(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFeedbackListener(BuildContext context, FeedbackState state) {
    if (state is FeedbackDoneState) {
      showDialog(context: context, builder: (context) => CupertinoAlertDialog(
        content: Text(state.message),
        actions: [
          TextButton(onPressed: (){
            context.pop();
          }, child: Text('Ok'),),
        ],
      ),);            
    }
  }
}
