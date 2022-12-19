
abstract class SportState {}

class SportEmptyState extends SportState {}

class SportLoadingState extends SportState {}

class SportLoadedState extends SportState {
  List<dynamic> loadedSports;
  SportLoadedState({required this.loadedSports});
}

class SportErrorState extends SportState {}