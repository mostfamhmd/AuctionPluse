part of 'delete_favorite_product_cubit.dart';

sealed class DeleteFavoriteProductState {}

final class DeleteFavoriteProductInitial extends DeleteFavoriteProductState {}

final class DeleteProdWhichListLoading extends DeleteFavoriteProductState {}

final class DeleteProductWhichListSuccess extends DeleteFavoriteProductState {
  final DeletedProductwhichListModel deletedProductwhichListModel;

  DeleteProductWhichListSuccess({required this.deletedProductwhichListModel});
}

final class DeleteProductWhichListError extends DeleteFavoriteProductState {
  final String error;
  DeleteProductWhichListError({required this.error});
}
