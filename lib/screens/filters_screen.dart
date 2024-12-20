import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;
  static const routeName = '/filters';

  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;



  @override 
initState() {
     _glutenFree = widget.currentFilters['gluten'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String subtitle, bool status,
      void Function(bool) upDateValue) {
    return SwitchListTile(
      title: Text(title),
      value: status,
      subtitle: Text(subtitle),
      onChanged: upDateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('your filters'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            Map<String, bool> selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian
            };
            print(selectedFilters);
            widget.saveFilters(selectedFilters);
          },
        ),
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your mean selection,',
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluteen-free',
                  'only include gluteen free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  'only include lactose free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegeterian',
                  'only include Vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'only include Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
