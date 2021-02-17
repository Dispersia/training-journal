import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_journal/src/challenges/9c/tile.dart';

class Weighted extends StatelessWidget {
  final String description;

  Weighted(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: BlocBuilder<WeightBloc, WeightState>(
        builder: (context, state) {
          return ListView(
            children: [
              Text(description),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText:
                      state.weight > 0 ? state.weight.toString() : 'Weight',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  BlocProvider.of<WeightBloc>(context).add(
                    WeightUpdate(
                      weight: int.parse(value),
                    ),
                  );
                },
              ),
              if (state is WeightSet)
                ...getTiles(
                  [
                    Tile(10, '120% (${state.weight * 1.20})'),
                    Tile(9, '100% (${state.weight * 1.0})'),
                    Tile(8, '80% (${state.weight * .8})'),
                    Tile(7, '60% (${state.weight * .6})'),
                    Tile(6, '50% (${state.weight * .5})'),
                    Tile(5, '40% (${state.weight * .4})'),
                    Tile(4, '30% (${state.weight * .3})'),
                    Tile(3, '20% (${state.weight * .2})'),
                    Tile(2, '10% (${state.weight * .1})'),
                    Tile(1, '0% (0... duhh)'),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
