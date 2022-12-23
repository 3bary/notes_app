import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import 'color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child:
          ListView.builder(
            itemCount: kColors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: (){
                    BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                    currentIndex = index;
                    setState(() {

                    });
                  },
                  child: ColorItem(
                    isActive: currentIndex == index, color: kColors[index],
                  ),
                ),
              ),
          ),
    );
  }
}

