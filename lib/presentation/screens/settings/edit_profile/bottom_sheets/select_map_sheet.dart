import 'dart:io';
import 'package:flutter/material.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/extension/string_modification.dart';

class SelectMapBottomSheet extends StatelessWidget {
  final String address;
  const SelectMapBottomSheet({super.key , required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   '',
                //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: AppButtonOutlined(
              onPressed: () {
                address.openAddressInGoogleMap()..then((_){
                  
                })..catchError((_){

                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Google Maps',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              24.0,
              8.0,
              24.0,
              Platform.isAndroid ? 12 : 8,
            ),
            child: AppButtonOutlined(
              onPressed: () {
                address.openAddressInAppleMap()..then((_){

                })..catchError((_){

                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Apple Maps',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
