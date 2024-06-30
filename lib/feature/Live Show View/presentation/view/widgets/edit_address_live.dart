import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/address_field.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/services/update_wanted_room.dart';

class EditAddressLive extends StatelessWidget {
  const EditAddressLive({
    super.key,
    required this.contAddress,
    this.hintText,
    required this.wantedRoom,
  });

  final TextEditingController contAddress;
  final String? hintText;
  final WantedEventModel wantedRoom;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: addressField(contAddress: contAddress, hintText: hintText),
        ),
        IconButton(
            onPressed: () {
              if (contAddress.text.isNotEmpty &&
                  contAddress.text != wantedRoom.title!) {
                UpdateWantedRoomService().updateWantedRoom(
                    roomID: wantedRoom.sId!,
                    event: false,
                    name: contAddress.text);
                contAddress.clear();
              } else {
                myErrorSnackBar(context, "changed title your live show");
              }
            },
            icon: Icon(
              size: 35.sp,
              Icons.done_outline_sharp,
              color: Colors.green,
            )),
      ],
    );
  }
}
