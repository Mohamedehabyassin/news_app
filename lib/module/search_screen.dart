import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/common_widget.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search_sharp),
                        border: OutlineInputBorder()),
                    onChanged: (searchValue) {
                      AppCubit.get(context).getSearch(searchValue);
                    },
                  ),
                  const SizedBox(height: 30),
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
