import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/localized/generated/l10n.dart';
import 'package:sales_counter/ui/screen/settings/settings_presenter.dart';
import 'package:sales_counter/ui/widgets/check_box_widget.dart';
import 'package:sales_counter/ui/widgets/text_field_allow_edit_widget.dart';
import 'package:sales_counter/ui/widgets/text_field_widget.dart';

class SettingsScreenWidget extends StatelessWidget {
  const SettingsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SettingsScreenWidget();
  }
}

class _SettingsScreenWidget extends ConsumerWidget {
  const _SettingsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.read(settingsScreenPresenter.notifier);
    const divider = SizedBox(height: 15);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.settingsTitleAppBar),
        excludeHeaderSemantics: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final isAllowEdit = ref.watch(
                      settingsScreenPresenter.select(
                        (value) => value.isAllowEditID,
                      ),
                    );
                    return TextFieldAllowEditWidget(
                      controller: presenter.getTextEditingController('userId'),
                      labelText: S.current.settingsFieldUserID,
                      isAllowEdit: isAllowEdit,
                      changeAllowEdit: presenter.allowEditId,
                    );
                  },
                ),
                divider,
                TextFieldWidget(
                  controller: presenter.getTextEditingController('userName'),
                  labelText: S.current.settingsFieldName,
                  isEnabled: true,
                ),
                divider,
                TextFieldWidget(
                  controller: presenter.getTextEditingController('userEmail'),
                  labelText: S.current.settingsFieldEMail,
                  isEnabled: true,
                ),
                divider,
                Consumer(
                  builder: (context, ref, child) {
                    final seller = ref.watch(
                      settingsScreenPresenter.select(
                        (value) => value.seller,
                      ),
                    );
                    return CheckBoxWidget(
                      value: seller,
                      name: S.current.settingsFieldSeller,
                      changeCheckBox: presenter.changeSeller,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final settingsScreenPresenter =
    StateNotifierProvider.autoDispose<SettingsScreenPresenterNotifier, SettingsScreenPresenterState>(
        SettingsScreenPresenterNotifier.new);
