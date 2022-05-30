import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinkBar extends StatelessWidget {
  const LinkBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: (size.width > 1000) ? size.height * 0.07 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            // ignore: avoid_print
            LinkText(text: 'Acerca de', onPressed: () => print('Acerca de ')),
            const LinkText(text: 'Centro de Ayuda'),
            const LinkText(text: 'Términos y Condiciones'),
            const LinkText(text: 'Políticas de Privacidad'),
            const LinkText(text: 'Blog'),
          ],
        ));
  }
}
