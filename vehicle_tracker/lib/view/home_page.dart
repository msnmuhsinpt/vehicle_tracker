import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vehicle_tracker/bloc/vehicle_bloc.dart';
import 'package:vehicle_tracker/model/vehicle_model.dart';
import 'package:vehicle_tracker/util/app_color.dart';
import 'package:vehicle_tracker/util/app_ constant.dart';
import 'package:vehicle_tracker/widget/add_vehicle.dart';
import 'package:vehicle_tracker/widget/app_text_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required}) : super(key: key);

  List<VehicleModel> vehicleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: commonPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dividerSH(),
              Center(
                child: appTextView(
                    name: 'Vehicle List',
                    isBold: true,
                    color: AppColor.kBlack,
                    size: 20),
              ),
              dividerH(),
              BlocConsumer<VehicleBloc, VehicleState>(
                listener: (context, state) {
                  log("undatedValue>>${state.allVehicle[0].isInTimer}");
                },
                builder: (context, state) {
                  List<VehicleModel> vehicleList = state.allVehicle;

                  return Expanded(
                    child: ListView.separated(
                      itemCount: vehicleList.length,
                      separatorBuilder: (context, index) => dividerSH(),
                      itemBuilder: (context, index) {
                        var id = vehicleList[index].id.toString();
                        var number =
                            vehicleList[index].vehicleNumber.toString();
                        var vehicleStatus = vehicleList[index].isInTimer;

                        log("VehicleStatus>>>>  $vehicleStatus");

                        return vehicleList.isEmpty
                            ? Center(
                                child: appTextView(name: "No Vehicle"),
                              )
                            : vehicleStatus
                                ? SizedBox(
                                    height: 85,
                                    child: InkWell(
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                            leading: appTextView(
                                                name: 'Id: $id', isBold: true),
                                            title: appTextView(
                                                name: number, isBold: true),
                                            trailing: CircularPercentIndicator(
                                              animation: true,
                                              radius: 20.0,
                                              percent: 1.0,
                                              progressColor: Colors.green,
                                              animationDuration: 1000,
                                              onAnimationEnd: () {
                                                context.read<VehicleBloc>().add(
                                                    StopVehicle(
                                                        vehicleModel:
                                                            VehicleModel(
                                                                vehicleNumber:
                                                                    number,
                                                                id: id,
                                                                isInTimer:
                                                                    false)));
                                                log("Id >>> $id");
                                                log("Number >>> $number");
                                                log("TimeStopFun>>>>");
                                              },
                                            )),
                                      ),
                                      onTap: () {
                                        log("isStatus >>> $vehicleStatus");
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: 85,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        color: AppColor.kRed,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: appTextView(
                                              name: 'Sent',
                                              isBold: true,
                                              color: AppColor.kWhite,
                                              size: 18),
                                        )),
                                  );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: AppColor.kBlue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AddVehiclePop(),
          );
        },
        // isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
