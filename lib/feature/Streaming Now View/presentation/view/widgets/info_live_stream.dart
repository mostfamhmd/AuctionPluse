import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/selected_name_product_container.dart';
import 'package:smart_auction/core/widgets/Components/sentances_of_streaming_now.dart';
import 'package:smart_auction/core/widgets/Components/text_chat.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Create%20Room%20Cubit/create_room_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Generate%20Agora%20RTM%20Tokens%20Cubit/generate_agora_token_cubit.dart';
import 'package:smart_auction/feature/Streaming%20Now%20View/presentation/view/widgets/tag_users_products.dart';

class InfoLiveStream extends StatefulWidget {
  const InfoLiveStream({
    super.key,
    required this.allProducts,
    required this.allUsers,
  });
  final List<ProductInfo> allProducts;
  final List<AllUsers> allUsers;
  @override
  State<InfoLiveStream> createState() => _InfoLiveStreamState();
}

class _InfoLiveStreamState extends State<InfoLiveStream> {
  TextEditingController contAddress = TextEditingController();
  TextEditingController contUsers = TextEditingController();
  TextEditingController contProducts = TextEditingController();
  TextEditingController contTime = TextEditingController();
  ValueNotifier<bool> allowedChat = ValueNotifier(false);
  List<AllUsers> users = [];
  List<ProductInfo> products = [];
  int? timestamp;
  String rtmtoken = "";
  String? evenToken;
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
            if (evenToken != null && evenToken != "") {
              context.read<CreateRoomCubit>().createRoom(
                    evenToken: evenToken!,
                    allowedChat: allowedChat.value,
                    address: contAddress.text,
                    users: users,
                    products: products,
                    timeStamp: DateTime.now().microsecondsSinceEpoch,
                    rtmtoken: rtmToken.generatedToken.token!,
                    event: true,
                  );
            }
          } else if (rtmToken is GenerateRTMTokenError) {
            myErrorSnackBar(context, rtmToken.errorMessage);
          } else if (rtmToken is GenerateRTMTokenLoading) {
            myLoadingSnackBar(context, "Loading to generate agora token");
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // direct talk name
                const DirectTalkName(),
                // What do you want to talk about?
                const TalkAbout(),
                SizedBox(height: 30.h),
                //live name
                customTextFormFieldWithoutPrefix(
                    keyboardType: TextInputType.text, controller: contAddress),
                SizedBox(height: 20.h),
                // tag Users
                TagUsersProducts(
                  tagName: "Users",
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
                // selected users
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: users.isNotEmpty ? 10.h : 0),
                  child: Wrap(
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
                        child: SelectedNameProductContainer(
                            name: users[index].name!),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // tag product
                TagUsersProducts(
                  tagName: "Products",
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
                SizedBox(height: 20.h),
                // selected products
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: products.isNotEmpty ? 10.h : 0),
                  child: Wrap(
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
                ),
                SizedBox(height: 15.h),
                // text chat with switch for toggle
                ValueListenableBuilder(
                  valueListenable: allowedChat,
                  builder: (BuildContext context, value, Widget? child) =>
                      TextChat(
                    onChanged: (value) {
                      allowedChat.value = value;
                    },
                    caseSwitch: value,
                  ),
                ),
                SizedBox(height: 15.h),
                // Can the audience send messages in a live Tok broadcast?
                const SendingMessage(),
                SizedBox(height: 30.h),
                // live broadcast
                Center(
                  child: MySmallBTN(
                    nameButton: 'Live Broadcast',
                    onTap: () {
                      if (users.isEmpty ||
                          products.isEmpty ||
                          contAddress.text.isEmpty) {
                        myErrorSnackBar(context, "all Data required to send");
                      } else {
                        context
                            .read<GenerateAgoraTokenCubit>()
                            .generateAgoraToken(channelName: contAddress.text);
                        if (allowedChat.value == true) {
                          context
                              .read<GenerateRTMTokenCubit>()
                              .generateRTMToken();
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
                          products.clear();
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
                      contProducts.text += products[0].name!;
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
