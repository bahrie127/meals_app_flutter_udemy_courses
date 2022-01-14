import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

typedef SaveFunc = void Function(Map<String, bool>);

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final SaveFunc saveFilters;

  const FiltersScreen({
    Key? key,
    required this.currentFilters,
    required this.saveFilters,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

typedef BoolFunc = void Function(bool);

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _veganFree = false;
  bool _vegetarianFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _veganFree = widget.currentFilters['vegan'] as bool;
    _vegetarianFree = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    BoolFunc updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _veganFree,
                  'vegetarian': _vegetarianFree,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan-free',
                  'Only include Vegan-free meals.',
                  _veganFree,
                  (newValue) {
                    setState(() {
                      _veganFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegatarian-free',
                  'Only include Vegetarian-free meals.',
                  _vegetarianFree,
                  (newValue) {
                    setState(() {
                      _vegetarianFree = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
