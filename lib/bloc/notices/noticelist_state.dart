part of 'noticelist_bloc.dart';

class NoticelistState extends Equatable {
  List<Object> get props => [];
}

class Empty extends NoticelistState {}

class Loading extends NoticelistState {}

class Success extends NoticelistState {
  List<Notice> notices;

  Success(this.notices);

  @override
  List<Object> get props => [notices];
}

class Failure extends NoticelistState {
  String error;

  Failure(this.error);

  @override
  List<Object> get props => [error];
}
