part of 'news_bloc.dart';

@immutable
sealed class NewsEvent extends Equatable {}

class NewsLoad extends NewsEvent {
  @override
  List<Object?> get props => [];
}
