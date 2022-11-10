import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vehicle_tracker/bloc/vehicle_bloc.dart';
import 'package:vehicle_tracker/model/vehicle_model.dart';
import 'package:vehicle_tracker/util/app_%20constant.dart';
import 'package:vehicle_tracker/util/app_color.dart';
import 'package:vehicle_tracker/widget/app_text_field.dart';
import 'package:vehicle_tracker/widget/app_text_view.dart';

class AddVehiclePop extends StatelessWidget {
  const AddVehiclePop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _vehicleId = TextEditingController();
    TextEditingController _vehicleNumber = TextEditingController();
    return AlertDialog(
      title: appTextView(name: 'Add Vehicle', isBold: true),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //id
          AppTextField(
            controller: _vehicleId,
            hintText: 'Id',
            inputAction: TextInputAction.next,
            //for iphone
            inputType: TextInputType.text,
            /*inputType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),*/
          ),
          dividerSH(),
          AppTextField(
            controller: _vehicleNumber,
            hintText: 'Number',
            inputAction: TextInputAction.next,
            inputType: TextInputType.text,
          ),
          dividerH(),
          SizedBox(
            width: screenWidth(context) - 20,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (_vehicleId.text.toString() == "") {
                  EasyLoading.showToast("Add Id");
                } else if (_vehicleNumber.text.toString() == "") {
                  EasyLoading.showToast("Add Number");
                } else {
                  var vehicle = VehicleModel(
                      id: _vehicleId.text.toString(),
                      isInTimer: true,
                      vehicleNumber: _vehicleNumber.text.toString());
                  context
                      .read<VehicleBloc>()
                      .add(AddVehicle(vehicleModel: vehicle));
                  //pop close
                  Navigator.pop(context);
                }
              },
              child: appTextView(
                  name: 'Submit', isBold: true, color: AppColor.kWhite),
            ),
          )
        ],
      ),
    );
  }
}
