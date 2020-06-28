import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget childCard;
  final Function onPress;

  ReusableCard({@required this.color, this.childCard, this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPress: onPress, childCard: childCard, color: color);
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key key,
    @required this.onPress,
    @required this.childCard,
    @required this.color,
  }) : super(key: key);

  final Function onPress;
  final Widget childCard;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
