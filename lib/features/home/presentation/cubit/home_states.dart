abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class TabBarIndexChanged extends HomeStates{
  final int currentIndex;
  TabBarIndexChanged(this.currentIndex);
}

class TabBarIndexChangedSupplier extends HomeStates{
  final int currentIndex;
  TabBarIndexChangedSupplier(this.currentIndex);
}