import 'package:flutter/cupertino.dart';

class HStatusRecipe extends StatefulWidget {
  HStatusRecipe({Key key}) : super(key: key);

  @override
  _HStatusRecipeState createState() => _HStatusRecipeState();
}

class _HStatusRecipeState extends State<HStatusRecipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Text("todo"),
      ),
    );
  }
}
