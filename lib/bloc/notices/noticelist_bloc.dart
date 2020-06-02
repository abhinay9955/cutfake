import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'noticelist_event.dart';
part 'noticelist_state.dart';

class NoticelistBloc extends Bloc<NoticelistEvent, NoticelistState> {
  @override
  NoticelistState get initialState => NoticelistInitial();

  @override
  Stream<NoticelistState> mapEventToState(
    NoticelistEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
