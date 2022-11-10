import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_tracker/model/vehicle_model.dart';

part 'vehicle_event.dart';

part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(const VehicleState()) {
    on<AddVehicle>(_onAddVehicle);
    on<StopVehicle>(_onStopVehicle);
  }

  void _onAddVehicle(AddVehicle event, Emitter<VehicleState> emit) {
    final state = this.state;

    emit(VehicleState(
      allVehicle: List.from(state.allVehicle)..add(event.vehicleModel),
    ));
  }

  void _onStopVehicle(StopVehicle event, Emitter<VehicleState> emit) {
    final task = event.vehicleModel;
    // final int index = state.allVehicle.indexOf(task);
    // log("Vehicle Index>>>> $index");
    state.allVehicle[0].isInTimer = false;
    log("UpdateData>>>>${event.vehicleModel.vehicleNumber}");
    emit(VehicleState(allVehicle: List.from(state.allVehicle)));
  }
}
