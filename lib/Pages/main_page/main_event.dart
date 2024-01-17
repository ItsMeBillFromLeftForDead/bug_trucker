import '../../DataTypes/bug.dart';

abstract class MainEvent {}

class UpdateBugsEvent extends MainEvent {
  UpdateBugsEvent(this.bugs);

  final Iterable<Bug> bugs;
}

class SearchPatientsEvent extends MainEvent {
  SearchPatientsEvent(this.searchTerm);

  final String searchTerm;
}
