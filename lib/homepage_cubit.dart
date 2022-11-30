import 'dart:developer';

import 'package:bloc_flutter_reqres_simple/homepage_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homepage_cubit.freezed.dart';

@freezed
class HomepageState with _$HomepageState {
  const factory HomepageState.initial() = _Initial;
  const factory HomepageState.success(HomepageModel data) = _Success;
}

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(const HomepageState.initial());

  var dio = Dio();
  var BASE_URL = 'https://reqres.in';

  void getData() async {
    var response = await dio.get('$BASE_URL/api/users?page=2');

    print(response.data);

    var data = HomepageModel.fromJson(response.data);
    emit(HomepageState.success(data));
  }
}
