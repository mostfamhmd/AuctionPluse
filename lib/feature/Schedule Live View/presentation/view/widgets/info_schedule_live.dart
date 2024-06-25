// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/sentances_of_streaming_now.dart';
import 'package:smart_auction/core/widgets/Components/text_chat.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Create%20Room%20Cubit/create_room_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Generate%20Agora%20RTM%20Tokens%20Cubit/generate_agora_token_cubit.dart';

import '../../../../../core/widgets/Components/address_field.dart';
import '../../../../../core/widgets/Components/products_field.dart';
import '../../../../../core/widgets/Components/selected_name_product_container.dart';
import '../../../../../core/widgets/Components/time_starting_field.dart';
import '../../../../../core/widgets/Components/users_field.dart';

class InfoScheduleLive extends StatefulWidget {
  const InfoScheduleLive({
    super.key,
    required this.allProducts,
    required this.allUsers,
  });
  final List<ProductInfo> allProducts;
  final List<AllUsers> allUsers;

  @override
  State<InfoScheduleLive> createState() => _InfoScheduleLiveState();
}

class _InfoScheduleLiveState extends State<InfoScheduleLive> {
  TextEditingController contAddress = TextEditingController();
  TextEditingController contUsers = TextEditingController();
  TextEditingController contProducts = TextEditingController();
  TextEditingController contTime = TextEditingController();
  ValueNotifier<bool> allowedChat = ValueNotifier(false);
  List<AllUsers> users = [];
  List<ProductInfo> products = [];
  int? timestamp;
  String rtmtoken = "";
  String evenToken = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerateAgoraTokenCubit, GenerateAgoraTokenState>(
      listener: (context, agoraToken) {
        if (agoraToken is GenerateAgoraTokenSuccess) {
          evenToken = agoraToken.generatedToken.token!;
          if (allowedChat.value == false) {
            context.read<CreateRoomCubit>().createRoom(
                  evenToken: agoraToken.generatedToken.token!,
                  allowedChat: allowedChat.value,
                  address: contAddress.text,
                  users: users,
                  products: products,
                  timeStamp: timestamp!,
                );
          }
          setState(() {});
        } else if (agoraToken is GenerateAgoraTokenLoading) {
          myLoadingSnackBar(context, "Loading to generate agora token");
        } else if (agoraToken is GenerateAgoraTokenError) {
          myErrorSnackBar(context, agoraToken.errorMessage);
        }
      },
      child: BlocListener<GenerateRTMTokenCubit, GenerateRTMTokenState>(
        listener: (context, rtmToken) {
          if (rtmToken is GenerateRTMTokenSuccess) {
            if (evenToken != "") {
              context.read<CreateRoomCubit>().createRoom(
                    evenToken: evenToken,
                    allowedChat: allowedChat.value,
                    address: contAddress.text,
                    users: users,
                    products: products,
                    timeStamp: timestamp!,
                    rtmtoken: rtmToken.generatedToken.token!,
                  );
            }
          } else if (rtmToken is GenerateRTMTokenError) {
            myErrorSnackBar(context, rtmToken.errorMessage);
          } else if (rtmToken is GenerateRTMTokenLoading) {
            myLoadingSnackBar(context, "Loading to generate agora token");
          }
        },
        child: Column(
          children: [
            // the address
            addressField(contAddress: contAddress),
            SizedBox(height: 15.h),
            // add users
            usersField(
              context,
              contUsers: contUsers,
              onTap: () {
                for (int i = 0; i < users.length; i++) {
                  for (int j = 0; j < widget.allUsers.length; j++) {
                    if (users[i].sId == widget.allUsers[j].sId) {
                      widget.allUsers.remove(widget.allUsers[j]);
                    }
                  }
                }
                usersDialog(context);
                setState(() {});
              },
            ),
            SizedBox(height: 15.h),
            // selected users
            Wrap(
              children: List.generate(
                users.length,
                (index) => InkWell(
                  onTap: () {
                    widget.allUsers.add(users[index]);
                    users.remove(users[index]);
                    contUsers.clear();
                    for (int i = 0; i < users.length; i++) {
                      if (i == users.length - 1) {
                        contUsers.text += users[i].name!;
                      } else {
                        contUsers.text += "${users[i].name!}, ";
                      }
                    }
                    setState(() {});
                  },
                  child: SelectedNameProductContainer(name: users[index].name!),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            // add product
            productsField(
              contProducts: contProducts,
              onTap: () {
                for (int i = 0; i < products.length; i++) {
                  for (int j = 0; j < widget.allProducts.length; j++) {
                    if (products[i].sId == widget.allProducts[j].sId) {
                      widget.allProducts.remove(widget.allProducts[j]);
                    }
                  }
                }
                productsDialog(context);
                setState(() {});
              },
            ),
            SizedBox(height: 15.h),
            // selected products
            Wrap(
              children: List.generate(
                products.length,
                (index) => InkWell(
                  onTap: () {
                    widget.allProducts.add(products[index]);
                    products.remove(products[index]);
                    contProducts.clear();
                    for (int i = 0; i < products.length; i++) {
                      if (i == products.length - 1) {
                        contProducts.text += products[i].name!;
                      } else {
                        contProducts.text += "${products[i].name!}, ";
                      }
                    }
                    setState(() {});
                  },
                  child: SelectedNameProductContainer(
                    name: products[index].name!,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            // when do you want to live broadcasting?
            timeStartingField(
              contTime: contTime,
              onTap: () async {
                selectDateAndTime(context).then((selectedDate) {
                  if (selectedDate != null) {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((selectedTime) {
                      if (selectedTime != null) {
                        DateTime selectedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        timestamp = selectedDateTime.millisecondsSinceEpoch;
                        contTime.text =
                            "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} ${selectedDateTime.hour}:${selectedDateTime.minute}";
                      }
                    });
                  }
                });
              },
            ),
            SizedBox(height: 30.h),
            // text chat with switch for toggle
            ValueListenableBuilder(
              valueListenable: allowedChat,
              builder: (BuildContext context, value, Widget? child) => TextChat(
                onChanged: (value) {
                  allowedChat.value = value;
                },
                caseSwitch: value,
              ),
            ),
            SizedBox(height: 10.h),
            const SendingMessage(),
            SizedBox(height: 30.h),
            MySmallBTN(
              onTap: () {
                if (users.isEmpty ||
                    products.isEmpty ||
                    contTime.text.isEmpty ||
                    contAddress.text.isEmpty ||
                    timestamp == null) {
                  myErrorSnackBar(context, "all Data required to send");
                } else {
                  context
                      .read<GenerateAgoraTokenCubit>()
                      .generateAgoraToken(channelName: contAddress.text);
                  if (allowedChat.value == true) {
                    context.read<GenerateRTMTokenCubit>().generateRTMToken();
                  }
                }
              },
              nameButton: "Save",
            ),
          ],
        ),
      ),
    );
  }

  // selcting date and time
  Future<DateTime?> selectDateAndTime(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
  }

  // selcting products
  Future<dynamic> productsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const FailureState(error: "Select Users"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.allProducts.length,
              itemBuilder: (BuildContext context, int index) {
                ValueNotifier<bool> selecting = ValueNotifier(false);
                return ValueListenableBuilder(
                  valueListenable: selecting,
                  builder: (BuildContext context, value, Widget? child) =>
                      ListTile(
                    selected: value,
                    title: Text('${widget.allProducts[index].name}'),
                    onTap: () {
                      selecting.value = !selecting.value;
                      if (products.isEmpty) {
                        if (selecting.value == true) {
                          products.add(
                            widget.allProducts[index],
                          );
                        }
                      } else {
                        var existingUser = products.firstWhere(
                            (checkingProduct) =>
                                checkingProduct.sId ==
                                widget.allProducts[index].sId,
                            orElse: () => ProductInfo());
                        if (existingUser.sId == null) {
                          products.add(widget.allProducts[index]);
                        } else {
                          for (int i = 0; i < products.length; i++) {
                            if (products[i].sId == existingUser.sId) {
                              widget.allProducts.remove(users[i]);
                              break;
                            }
                          }
                        }
                      }
                      contProducts.clear();
                      for (int i = 0; i < products.length; i++) {
                        if (i == products.length - 1) {
                          contProducts.text += products[i].name!;
                        } else {
                          contProducts.text += "${products[i].name!}, ";
                        }
                      }
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(
                  fontFamily: AppFonts.kInter700,
                  color: AppColors.kLightBlue,
                  fontSize: 16.sp,
                ),
              ),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // selcting users
  Future<dynamic> usersDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        for (int i = 0; i < widget.allUsers.length; i++) {
          if (widget.allUsers[i].sId == userId) {
            widget.allUsers.remove(widget.allUsers[i]);
            break;
          }
        }
        return AlertDialog(
          title: const FailureState(error: "Select Users"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.allUsers.length,
              itemBuilder: (BuildContext context, int index) {
                ValueNotifier<bool> selecting = ValueNotifier(false);
                return ValueListenableBuilder(
                  valueListenable: selecting,
                  builder: (BuildContext context, value, Widget? child) =>
                      ListTile(
                    selected: value,
                    title: Text('${widget.allUsers[index].name}'),
                    onTap: () {
                      selecting.value = !selecting.value;
                      if (users.isEmpty) {
                        if (selecting.value == true) {
                          users.add(
                            widget.allUsers[index],
                          );
                        }
                      } else {
                        var existingUser = users.firstWhere(
                            (checkingUser) =>
                                checkingUser.sId == widget.allUsers[index].sId,
                            orElse: () => AllUsers());
                        if (existingUser.sId == null) {
                          users.add(widget.allUsers[index]);
                        } else {
                          for (int i = 0; i < users.length; i++) {
                            if (users[i].sId == existingUser.sId) {
                              widget.allUsers.remove(users[i]);
                              break;
                            }
                          }
                        }
                      }
                      contUsers.clear();
                      for (int i = 0; i < users.length; i++) {
                        if (i == users.length - 1) {
                          contUsers.text += users[i].name!;
                        } else {
                          contUsers.text += "${users[i].name!}, ";
                        }
                      }
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(
                  fontFamily: AppFonts.kInter700,
                  color: AppColors.kLightBlue,
                  fontSize: 16.sp,
                ),
              ),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
