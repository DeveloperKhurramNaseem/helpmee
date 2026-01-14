import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:help_mee/data/source/storage_service.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/profile_type_from_group_id.dart';
import 'package:help_mee/util/constants/util_functions.dart';
import 'package:help_mee/util/dependencies/init.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfilePreviewSheet extends StatefulWidget {
  final String? url;
  const ProfilePreviewSheet({super.key , this.url});

  @override
  State<ProfilePreviewSheet> createState() => _ProfilePreviewSheetState();
}

class _ProfilePreviewSheetState extends State<ProfilePreviewSheet> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();    
    var storageService = sl<StorageService>();
    var user = storageService.getUser();
    var profileType = getProfileType(user.userGroupId!).name.toString();
    var username = user.username;
    var url = widget.url ?? getProfilePreviewUrl(profileType, username ?? '');
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            log('onPageStarted -> Url : $url' , name: 'ProfilePreviewSheet');
          },
          onPageFinished: (String url) {
            log('onPageFinished -> Url : $url' , name: 'ProfilePreviewSheet');
          },
          onHttpError: (HttpResponseError error) {
            log('onHttpError -> Error : $error' , name: 'ProfilePreviewSheet');
          },
          onWebResourceError: (WebResourceError error) {
            log('onWebResourceError -> Error : $error' , name: 'ProfilePreviewSheet');
          },
          onNavigationRequest: (NavigationRequest request) {
            log('onNavigationRequest -> Url : ${request.url}' , name: 'ProfilePreviewSheet');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(url),
      );
    log(
      'Url : $url',
      name: 'ProfilePreviewSheet',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: AppSize.instance.height,
        color: Theme.of(context).scaffoldBackgroundColor,
        // padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
