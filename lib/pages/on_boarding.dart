import 'package:flutter/material.dart';
import 'package:all_for_my_pet/style/colors/colors_views.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;

  List<Map<String, String>> onBoardingDatas = [
    {
      "text": "ESPARCIMIENTO",
      "text1": "Brindamos todos los servicios para consentir",
      "image": 'assets/images/1.png',
    },
    {
      "text": "ADOPCIÓN",
      "text1": "Adopcion de mascotas",
      "image": 'assets/images/2.png',
    },
    {
      "text": "HOSPITALIDAD",
      "text1": "Completa hospitalidad",
      "image": 'assets/images/3.png',
    },
    {
      "text": "VETERINARIA",
      "text1": "Servicio de veterinaria",
      "image": 'assets/images/4.png',
    },
    {
      "text": "TIENDA",
      "text1": "Tienda de articulos",
      "image": 'assets/images/5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    int tam = onBoardingDatas.length;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        pages = value;
                        //print(pages);
                      });
                    },
                    itemCount: tam,
                    itemBuilder: (context, index) => ContentBoarding(
                      text: onBoardingDatas[index]["text"]!,
                      text1: onBoardingDatas[index]["text1"]!,
                      image: onBoardingDatas[index]["image"]!,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onBoardingDatas.length,
                            (index) => newMethod(index: index)),
                      ),
                    ],
                  ),
                ),
                _buttonBoarding(index: pages, tam: tam)
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer newMethod({int? index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 8),
      height: 4,
      width: pages == index ? 20 : 20,
      decoration: BoxDecoration(
        color: pages == index
            ? ColorsSelect.paginatorNext
            : ColorsSelect.paginator,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  _buttonBoarding({required int index, required int tam}) {
    if (index != tam - 1) {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: ColorsSelect.btnTextBo1,
            width: 3,
          ),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Siguiente',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          //shape: BoxShape.rectangle,
          //border: Border.all(
          color: ColorsSelect.btnBackgroundBo2,
          //width: 3,
          //),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Continuar',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}

class ContentBoarding extends StatelessWidget {
  final String text, text1, image;
  const ContentBoarding({
    Key? key,
    required this.text,
    required this.text1,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              width: 290,
              height: 290,
            ),
            Text(
              text,
              style: const TextStyle(
                color: ColorsSelect.txtBoHe,
                fontSize: 21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsSelect.txtBoSubHe,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
