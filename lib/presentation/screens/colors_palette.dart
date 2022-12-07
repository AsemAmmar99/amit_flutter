import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/colors_cubit/colors_cubit.dart';
import '../widgets/default_material_button.dart';

class ColorsPalette extends StatefulWidget {
  const ColorsPalette({Key? key}) : super(key: key);

  @override
  State<ColorsPalette> createState() => _ColorsPaletteState();
}

class _ColorsPaletteState extends State<ColorsPalette> {
  late ColorsCubit cubit;

  @override
  void initState() {
    cubit = ColorsCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          BlocBuilder<ColorsCubit, ColorsState>(
            builder: (context, state) {
              return Ink(
                color: cubit.backgroundColor,
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3)),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: BlocBuilder<ColorsCubit, ColorsState>(
                    builder: (context, state) {
                      return DefaultMaterialButton(
                        backgroundColor: cubit.colors.elementAt(0),
                        onPressed: () => cubit.selectColor(0),
                        child: Visibility(
                            visible:
                            cubit.backgroundColor == cubit.colors.elementAt(0),
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )),
                      );
                    },
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: BlocBuilder<ColorsCubit, ColorsState>(
                    builder: (context, state) {
                      return DefaultMaterialButton(
                        backgroundColor: cubit.colors.elementAt(1),
                        onPressed: () => cubit.selectColor(1),
                        child: Visibility(
                            visible: cubit.backgroundColor ==
                                cubit.colors.elementAt(1),
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )),
                      );
                    },
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: BlocBuilder<ColorsCubit, ColorsState>(
                    builder: (context, state) {
                      return DefaultMaterialButton(
                        backgroundColor: cubit.colors.elementAt(2),
                        onPressed: () => cubit.selectColor(2),
                        child: Visibility(
                            visible:
                            cubit.backgroundColor == cubit.colors.elementAt(2),
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )),
                      );
                    },
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: BlocBuilder<ColorsCubit, ColorsState>(
                    builder: (context, state) {
                      return DefaultMaterialButton(
                        backgroundColor: cubit.colors.elementAt(3),
                        onPressed: () => cubit.selectColor(3),
                        child: Visibility(
                            visible:
                            cubit.backgroundColor == cubit.colors.elementAt(3),
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )),
                      );
                    },
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: BlocBuilder<ColorsCubit, ColorsState>(
                    builder: (context, state) {
                      return DefaultMaterialButton(
                        backgroundColor: cubit.colors.elementAt(4),
                        onPressed: () => cubit.selectColor(4),
                        child: Visibility(
                            visible:
                            cubit.backgroundColor == cubit.colors.elementAt(4),
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
