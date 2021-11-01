import 'package:flutter/material.dart';

class ClimateImageWidget extends StatelessWidget {
  final String clime;
  const ClimateImageWidget({
    Key? key,
    required this.clime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      height: 175,
      child: Image.asset(
        _getImagePathForClime(clime),
        fit: BoxFit.fill,
      ),
    );
  }
}

String _getImagePathForClime(String clime) {
  String _basePath = 'assets/images/';
  switch (clime) {
    case 'nublado':
      return _basePath + 'totally_cloudy.png';

    case 'chuva leve':
      return _basePath + 'light_rain.png';

    case 'chuva moderada':
      return _basePath + 'thunderstorm.png';

    case 'céu limpo':
      return _basePath + 'sunny.png';

    default:
      return _basePath + 'partially_cloudy.png';
  }
}
