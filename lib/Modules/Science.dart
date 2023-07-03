import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/components.dart';
import '../Shared/Cubit/Cubit.dart';
import '../Shared/Cubit/State.dart';

class ScienceNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, StateApp>(
        listener: (context, state) {},
        builder: (context, state) {
        List <dynamic>? list=   CubitApp.get(context).science;
          return NewsBuilder(list!);
        });
  }
}
