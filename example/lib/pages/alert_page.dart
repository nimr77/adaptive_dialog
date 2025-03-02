import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:example/router/router.dart';
import 'package:example/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertRoute extends GoRouteData {
  const AlertRoute();
  @override
  Widget build(BuildContext context) => const AlertPage();
}

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('OK Dialog'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (onWillPop: false)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                onWillPop: () => Future.value(false),
              );
              assert(result == OkCancelResult.ok);
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (barrierDismissible: false)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                barrierDismissible: false,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (Custom okLabel)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'YES!',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (No Title)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                message: 'This is message.',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (No Message)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK Dialog (Theme builder)'),
            onTap: () async {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                builder: (context, child) => Theme(
                  data: ThemeData(
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(primary: Colors.orange),
                    ),
                  ),
                  child: child,
                ),
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (Default: Cancel)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                defaultType: OkCancelAlertDefaultType.cancel,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (Destructive)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                isDestructiveAction: true,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (long button label)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Long OK' * 2,
                cancelLabel: 'Long Cancel' * 2,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('OK/Cancel Dialog (useActionSheetForCupertino)'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                isDestructiveAction: true,
                cancelLabel: 'No!',
                useActionSheetForIOS: true,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text(
              'Yes/No Dialog (fullyCapitalizedForMaterial: true)',
            ),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Yes',
                cancelLabel: 'Decline It',
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text(
              'Yes/No Dialog (fullyCapitalizedForMaterial: false)',
            ),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: 'Title',
                message: 'This is message.',
                okLabel: 'Yes',
                cancelLabel: 'Decline It',
                fullyCapitalizedForMaterial: false,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('Confirmation Dialog (few selections)'),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    5,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text(
              'Confirmation Dialog (few selections / default selection)',
            ),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    5,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
                initialSelectedActionKey: 1,
              );
              logger.info(result);
            },
          ),
          ListTile(
            title: const Text('Confirmation Dialog (many selections)'),
            onTap: () async {
              final result = await showConfirmationDialog<int>(
                context: context,
                title: 'Title',
                message: 'This is message.',
                actions: [
                  ...List.generate(
                    20,
                    (index) => AlertDialogAction(
                      label: 'Answer $index',
                      key: index,
                    ),
                  ),
                ],
                shrinkWrap: false,
              );
              logger.info(result);
            },
          ),
        ],
      ),
    );
  }
}
