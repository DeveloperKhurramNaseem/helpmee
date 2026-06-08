import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/create_password_bloc/create_password_bloc.dart';

class CpErrorText extends StatelessWidget {
  const CpErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePasswordBloc, CreatePasswordState>(
      builder: (context, state) {
        if (state is CreatePasswordErrorState) {
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        state.message,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: SizedBox(),
        );
      },
    );
  }
}
