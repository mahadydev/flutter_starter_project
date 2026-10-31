import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_project/core/network/connection_checker/internet_connection_cubit.dart';
import 'package:flutter_starter_project/core/network/connection_checker/internet_connection_state.dart';
import 'package:material_ui/material_ui.dart';

class ConnectionStatusSection extends StatelessWidget {
  const ConnectionStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
      builder: (BuildContext context, InternetConnectionState state) {
        return Row(
          children: <Widget>[
            Text(state.status.name, style: TextStyle(fontSize: 16.sp)),
            SizedBox(width: 8.w),
            const Text(' - '),
            SizedBox(width: 8.w),
            Text(state.connectionType.name, style: TextStyle(fontSize: 16.sp)),
          ],
        );
      },
    );
  }
}
