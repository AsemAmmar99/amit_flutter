import 'package:amit_flutter/constants/my_cache_keys.dart';
import 'package:amit_flutter/data/local/my_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../presentation/styles/colors.dart';

part 'colors_state.dart';

class ColorsCubit extends Cubit<ColorsState> {
  ColorsCubit() : super(ColorsInitial());

  static ColorsCubit get(context) => BlocProvider.of<ColorsCubit>(context);

  List<Color> colors = [
    lightBrown,
    darkPurple,
    lightRed,
    lightSkyBlue,
    darkSkyBlue,
  ];

  Color backgroundColor = lightBrown;

  void selectColor(int index){
    backgroundColor = colors.elementAt(index);
    MyCache.putInt(key: MyCacheKeys.selectedColorIndex, value: index);
    emit(ColorSelectedState());
  }

}
