import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/app/di/injection.dart';
import 'package:flutter_starter_project/core/network/rest_api_client.dart';
import 'package:flutter_starter_project/core/shared/extensions/app_localization.dart';

class NetworkSection extends StatefulWidget {
  const NetworkSection({super.key});

  @override
  State<NetworkSection> createState() => _NetworkSectionState();
}

class _NetworkSectionState extends State<NetworkSection> {
  String? _networkResult;

  Future<void> _callNetwork() async {
    setState(() => _networkResult = context.localeKeys.loading);
    try {
      final response = await serviceLocator<RestApiClient>().getSomeData();
      setState(() => _networkResult = response);
    } on DioException catch (e) {
      setState(() => _networkResult = context.localeKeys.error(e.message!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.cloud_download, size: 20.sp),
          label: Text(
            context.localeKeys.callNetwork,
            style: TextStyle(fontSize: 14.sp),
          ),
          onPressed: _callNetwork,
        ),
        if (_networkResult != null) ...[
          SizedBox(height: 8.h),
          Text(_networkResult!, style: TextStyle(fontSize: 14.sp)),
        ],
      ],
    );
  }
}
