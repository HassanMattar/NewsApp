import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/Cubit/State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/components.dart';
import '../Shared/Cubit/Cubit.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, StateApp>(
        listener: (context, state) {},
        builder: (context, state) {
          List<dynamic>? list = CubitApp.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyInputTFF(
                      onChange: (value) {
                        CubitApp.get(context).SearhNews(value);
                      },
                      onSubmit: (value) {},
                      validat: (value) {},
                      preIcon: Icon(Icons.search),
                      lable: "search"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 7, right: 7),
                          child: NewsBuilder(list)),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
