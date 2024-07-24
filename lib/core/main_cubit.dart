import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/Brand%20Cubits/Delete%20Brand%20Cubit/delete_brand_cubit.dart';
import 'package:smart_auction/core/managers/Brand%20Cubits/GetSpecificBrandCubit/get_specific_brand_cubit.dart';
import 'package:smart_auction/core/managers/Brand%20Cubits/Update%20Brand%20Cubit/update_brand_cubit.dart';
import 'package:smart_auction/core/managers/Category%20Cubits/Delete%20Category%20Cubit/delete_category_cubit.dart';
import 'package:smart_auction/core/managers/Category%20Cubits/Update%20Category%20Cubit/update_category_cubit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Specific%20SubCategory%20Cubit/specific_sub_category_cubit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Update%20SubCategory%20Cubit/update_sub_category_cubit.dart';
import 'package:smart_auction/core/managers/UpdateProductCubit/update_product_cubit.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/manager/Add%20Brand%20Cubit/add_brand_cubit.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/managers/Auction%20Cubit/create_auction_cubit.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/manager/Delete%20Coupon%20Cubit/delete_coupon_cubit.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/manager/Get%20All%20Coupons%20Cubit/get_all_coupons_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Specific%20Coupon%20Cubit/get_specific_coupon_cubit.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/manager/AddCategoryCubit/add_category_cubit.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/manager/Add%20New%20Coupon%20Cubit/add_new_coupon_cubit.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/manager/Update%20Coupon%20Cubit/update_coupon_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Delete%20Product%20Cart%20Cubit/delete_product_cart_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Cart%20Product%20Cubit/get_cart_product_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Update%20Product%20Cart%20Cubit/update_product_cart_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Add%20Product%20To%20Cart%20Cubit/add_product_to_cart_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Is%20Favorite/is_favorite_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Review%20Cubit/review_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Selected%20Color%20Cubit/selected_color_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/Delete%20Product%20WhichListCubit/delete_favorite_product_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/WhichList%20Cubit/which_list_cubit.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/manager/RemoveHandCubit/remove_user_from_raised_hand_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/manager/Delete%20Specific%20Product%20Cubit/delete_specific_product_cubit.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/manager/Get%20Admin%20Products%20Cubit/get_admin_products_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/DeleteReviewCubit/delete_review_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/EditReviewCubit/edit_review_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/manager/Add%20Comment%20Cubit/add_comment_cubit.dart';

class MainCubit extends StatelessWidget {
  const MainCubit({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => GetBrandsCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSubCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFavoriteProductCubit(),
        ),
        BlocProvider(
          create: (context) => WhichListCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteReviewCubit(),
        ),
        BlocProvider(
          create: (context) => AddCommentCubit(),
        ),
        BlocProvider(
          create: (context) => EditReviewCubit(),
        ),
        BlocProvider(
          create: (context) => AddProductToCartCubit(),
        ),
        BlocProvider(
          create: (context) => IsFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(
          create: (context) => ReviewCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteReviewCubit(),
        ),
        BlocProvider(
          create: (context) => GetCartProductCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteProductCartCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProductCartCubit(),
        ),
        BlocProvider(
          create: (context) => RemoveUserFromRaisedHandCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateRoomCubit(),
        ),
        BlocProvider(
          create: (context) => AddCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => AddNewCouponCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateCouponCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteCouponCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllCouponsCubit(),
        ),
        BlocProvider(
          create: (context) => GetSpecificCouponCubit(),
        ),
        BlocProvider(
          create: (context) => GetAdminProductsCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteSpecificProductCubit(),
        ),
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProductCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteBrandCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateBrandCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateSubCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => AddBrandCubit(),
        ),
        BlocProvider(
          create: (context) => SpecificSubCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => GetSpecificBrandCubit(),
        ),
        BlocProvider(
          create: (context) => RemoveUserFromSpeakersCubit(),
        ),
        BlocProvider(
          create: (context) => RemoveLiveCubit(),
        ),
        BlocProvider(
          create: (context) => RemoveUserFromLiveCubit(),
        ),
        BlocProvider(
          create: (context) => CreateAuctionCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateAuctionCubit(),
        ),
      ],
      child: child,
    );
  }
}
