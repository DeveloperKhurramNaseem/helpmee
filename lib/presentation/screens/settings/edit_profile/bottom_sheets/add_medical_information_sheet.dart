import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/bottom_sheets/add_disease_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class AddMedicalInformationSheet extends StatelessWidget {
  const AddMedicalInformationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add medical information',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          for (var i = 0; i < 8; i++)
            AddMedicalInformationTile(
              title: 'Medical information ${i + 1}',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return AddDiseaseSheet(
                      title: 'Allergies',
                      description:
                          'Do you have allergies?\nThen please enter the details in the field below.',
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}

class AddMedicalInformationTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AddMedicalInformationTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: AppSize.instance.height * 0.065,
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 249, 249, 0.55),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(237, 237, 237, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 8, 18),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(AppIcons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
