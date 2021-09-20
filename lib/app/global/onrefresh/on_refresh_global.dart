import 'package:flutter/material.dart';

class OnRefreshGlobal extends StatelessWidget {
  final Future<void> onPress;
  const OnRefreshGlobal({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onPress,
      color: Colors.green,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Text("No tienes anuncios Favoritos"),
            ),
          )
        ],
      ),
    );
  }
}
