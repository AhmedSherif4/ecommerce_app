part of '../account.dart';

@Injectable()
class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState());
}
