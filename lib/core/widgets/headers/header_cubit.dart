import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderCubit extends Cubit<bool> {
  HeaderCubit() : super(true); // header is visible by default

  void show() => emit(true);
  void hide() => emit(false);
  void toggle() => emit(!state);
}
