import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';
import 'package:sales_counter/ui/widgets/mixin_text_edit_controller_manager.dart';

@immutable
class SettingsScreenPresenterState {
  final bool seller;
  final bool isAllowEditID;

  const SettingsScreenPresenterState({
    required this.seller,
    this.isAllowEditID = false,
  });

  SettingsScreenPresenterState copyWith({
    bool? seller,
    bool? isAllowEditID,
  }) {
    return SettingsScreenPresenterState(
      seller: seller ?? this.seller,
      isAllowEditID: isAllowEditID ?? this.isAllowEditID,
    );
  }
}

class SettingsScreenPresenterNotifier extends StateNotifier<SettingsScreenPresenterState>
    with MixinTextEditControllerManager {
  final Ref _ref;

  SettingsScreenPresenterNotifier(this._ref) : super(const SettingsScreenPresenterState(seller: false)) {
    final settings = _ref.read(settingsProvider);
    defaultTextEditingValues = {
      'userId': settings.userId,
      'userName': settings.userName,
      'userEmail': settings.userEmail,
    };
    if (state.seller != settings.seller) state = state.copyWith(seller: settings.seller);
  }

  void changeSeller() {
    state = state.copyWith(seller: !state.seller);
  }

  void allowEditId() {
    state = state.copyWith(isAllowEditID: true);
  }

  @override
  void dispose() {
    final resultState = SettingsModel(
      userId: getValueTextEditing('userId'),
      userName: getValueTextEditing('userName'),
      userEmail: getValueTextEditing('userEmail'),
      seller: state.seller,
    );
    _ref.read(settingsProvider.notifier).updateSettings(resultState);
    super.dispose();
  }
}
