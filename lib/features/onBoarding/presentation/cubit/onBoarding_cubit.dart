import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../pages/OnBoarding_screen.dart';
import 'onBoarding_states.dart';

class OnBoardingCubit extends Cubit <OnBoardingStates>{
  OnBoardingCubit() : super(InitialOnBoardingState());
  static final OnBoardingCubit _onBoardingCubit = BlocProvider.of<OnBoardingCubit>(navigatorKey.currentState!.context);
  static OnBoardingCubit get instance => _onBoardingCubit;
////////////////////////////////////////////////////////////////////////////////
  bool isLast = false;
  changeIsLast(int index){
    if (index == onBoardingDescriptions.length-1){
      isLast = true;
      emit(MoveToHomeTrue());
    }else{
      isLast = false;
      emit(MoveToHomeFalse());
    }
  }
////////////////////////////////////////////////////////////////////////////////
}