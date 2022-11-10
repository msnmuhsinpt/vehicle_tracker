class VehicleModel {
  String id;
  String vehicleNumber;
  bool isInTimer;

  VehicleModel(
      {required this.id, required this.vehicleNumber, this.isInTimer = false});
}
