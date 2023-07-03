import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/Cubit/Cubit.dart';
import 'package:flutter_application_1/Shared/Cubit/State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/components.dart';

class BusinessNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, StateApp>(
        listener: (context, state) {},
        builder: (context, state) {
            List <dynamic>? list=   CubitApp.get(context).business;
          return NewsBuilder(list!);   });
  }
}
