import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snackbar_screen";
  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿ Estas Seguro ?'),
              content: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a sapien sit amet orci egestas auctor nec et magna. Ut magna nisl, blandit quis justo at, vulputate viverra nunc. Fusce eget nisi ligula. Vestibulum risus purus, lobortis sit amet erat vitae, gravida rutrum lacus. In elementum turpis in elementum porttitor. Sed mattis tristique mauris id convallis. Nam maximus diam ipsum, ac porttitor felis dignissim at. Maecenas pretium libero non nibh bibendum cursus. Aliquam nec interdum quam, eget porttitor lacus.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SbackBars y Dialogos'),
        ),
        body: Center(
          child: Column(
            children: [
              FilledButton.tonal(
                  onPressed: () {
                    showAboutDialog(context: context, children: [
                      const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a sapien sit amet orci egestas auctor nec et magna. Ut magna nisl, blandit quis justo at, vulputate viverra nunc. Fusce eget nisi ligula. Vestibulum risus purus, lobortis sit amet erat vitae, gravida rutrum lacus. In elementum turpis in elementum porttitor. Sed mattis tristique mauris id convallis. Nam maximus diam ipsum, ac porttitor felis dignissim at. Maecenas pretium libero non nibh bibendum cursus. Aliquam nec interdum quam, eget porttitor lacus.')
                    ]);
                  },
                  child: const Text('Licencias Usadas')),
              FilledButton.tonal(
                  onPressed: () => openDialog(context),
                  child: const Text('Mostrar Dialogo de Pantalla'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackBar(context),
        ));
  }
}
