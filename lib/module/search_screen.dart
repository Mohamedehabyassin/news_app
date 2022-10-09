import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/common_widget.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).search;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  appTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onChange: (String value) {
                        debugPrint(value);
                        debugPrint(searchController.text);
                        AppCubit.get(context).getSearch(value);
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Search must not be Empty';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search_sharp),
                  list.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  buildArticleItem(list[index], context),
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: list.length))
                      : const Center(child: CircularProgressIndicator())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
