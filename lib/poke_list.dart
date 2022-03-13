import 'package:flutter/material.dart';
import 'package:pokedex_app_flutter/const/const.dart';
import 'package:pokedex_app_flutter/models/pokemon.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';
import './models/favorite.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int pageSize = 30;
  bool isFavoriteMode = true;
  int _currentPage = 1;

  List<Favorite> favMock = [
    Favorite(pokeId: 1),
    Favorite(pokeId: 4),
    Favorite(pokeId: 7),
  ];

  int itemCount(int page) {
    int ret = page * pageSize;
    if (isFavoriteMode && ret > favMock.length) {
      ret = favMock.length;
    }
    if (ret > pokeMaxId) {
      ret = pokeMaxId;
    }
    return ret;
  }

  int itemId(int index) {
    int ret = index + 1;
    if (isFavoriteMode) {
      ret = favMock[index].pokeId;
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokes, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemCount: itemCount(_currentPage) + 1,
        itemBuilder: (context, index) {
          if (index == itemCount(_currentPage)) {
            return OutlinedButton(
              child: const Text('more'),
              onPressed: () => {
                setState(() => _currentPage++),
              },
            );
          } else {
            return PokeListItem(
              poke: pokes.byId(itemId(index)),
            );
          }
        },
      ),
    );
  }
}
