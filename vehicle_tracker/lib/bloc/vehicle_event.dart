part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object> get props => [];
}

//add vehicle

class AddVehicle extends VehicleEvent {
  final VehicleModel vehicleModel;

  const AddVehicle({required this.vehicleModel});

  @override
  List<Object> get props => [];
}
//stop vehicle

class StopVehicle extends VehicleEvent {
  final VehicleModel vehicleModel;

  const StopVehicle({required this.vehicleModel});

  @override
  List<Object> get props => [];
}
