import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/forget_password/forget_password_bloc.dart';

class FpErrorText extends StatelessWidget {
  const FpErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
      builder: (context, state) {
        if (state is ForgetPasswordErrorState) {
          return Opacity(
            opacity: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      state.message,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(),
        );
      },
    );
  }
}
