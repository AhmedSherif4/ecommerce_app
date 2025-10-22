part of '../../address.dart';

@Injectable()
class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(const AddressState());

  /// ✅ إضافة عنوان جديد
  void addAddress(AddressModel address) {
    final updated = List<AddressModel>.from(state.addresses)..add(address);
    emit(state.copyWith(addresses: updated));
  }

  /// ✅ تحديد العنوان المختار
  void selectAddress(int index) {
    final updated = state.addresses.asMap().entries.map((entry) {
      return entry.value.copyWith(isSelected: entry.key == index);
    }).toList();
    emit(state.copyWith(addresses: updated));
  }

  /// ✅ تغيير العنوان الافتراضي
  void setDefaultAddress(int index) {
    final updated = state.addresses.asMap().entries.map((entry) {
      return entry.value.copyWith(isDefault: entry.key == index);
    }).toList();
    emit(state.copyWith(addresses: updated));
  }

  /// ✅ تحميل بيانات أولية (اختياري)
  void loadAddresses() {
    final initial = [
      AddressModel(
        title: "Home",
        details: "925 S Chugach St #APT 10, Alaska 99645",
        isDefault: true,
        isSelected: true,
      ),
      AddressModel(title: "Work", details: "22 Downtown Ave, Chicago, IL"),
    ];
    emit(state.copyWith(addresses: initial));
  }
}
