part of 'vehicle_bloc.dart';

class VehicleState extends Equatable {
  final List<VehicleModel> allVehicle;

  const VehicleState({this.allVehicle = const <VehicleModel>[]});

  @override
  List<Object> get props => [allVehicle];
}
