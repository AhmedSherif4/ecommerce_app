part of '../../address.dart';

class AddressState {
  final List<AddressModel> addresses;

  const AddressState({this.addresses = const []});

  AddressState copyWith({List<AddressModel>? addresses}) {
    return AddressState(addresses: addresses ?? this.addresses);
  }
}
