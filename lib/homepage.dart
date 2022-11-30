import 'package:bloc_flutter_reqres_simple/homepage_cubit.dart';
import 'package:bloc_flutter_reqres_simple/homepage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BLOC Flutter Reqres Simple'),
        ),
        body: BlocProvider(
          create: (context) => HomepageCubit(),
          child: BlocBuilder<HomepageCubit, HomepageState>(
            builder: (context, state) {
              return state.when(initial: () {
                context.read<HomepageCubit>().getData();

                return const Center(child: Text('Loading...'));
              }, success: (HomepageModel data) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var name = data.data?[index].firstName ?? '';
                    var email = data.data?[index].email ?? '';

                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(name), Text(email)],
                      ),
                    );
                  },
                );
              });
            },
          ),
        ));
  }
}
