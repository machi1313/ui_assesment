import 'package:bloc/bloc.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  void changeTab(int index) => emit(index);

  void openWithIndex(int index) => emit(index);
}
