import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import 'base_screen_states.dart';

class BaseScreenCubit extends Cubit <BaseScreenStates>{
  BaseScreenCubit() : super(InitialBaseScreenState());
  static final BaseScreenCubit _baseScreenCubit = BlocProvider.of<BaseScreenCubit>(navigatorKey.currentState!.context);
  static BaseScreenCubit get instance => _baseScreenCubit;
////////////////////////////////////////////////////////////////////////////////

}