import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miloficios_app/models/banner_publicitario.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/utils/session_helper.dart';
import 'package:miloficios_app/views/listar_subcategorias.dart';
import 'package:provider/provider.dart';

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  int bannerActual = 0;

  @override
  void initState() {
    super.initState();
    consultarInfoUsuario();
  }

  void consultarInfoUsuario() async {
    await HttpHelper().consultarUsuario();
    Provider.of<UserProvider>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<UserProvider>(context).token),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(
                    Provider.of<UserProvider>(context, listen: false)
                        .first_name),
                accountEmail: Text(
                    Provider.of<UserProvider>(context, listen: false).email)),
            ListTile(
              title: Text("Cerrar Sesión"),
              onTap: () {
                Provider.of<UserProvider>(context, listen: false)
                    .saveUserData("");
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            BannerPublicitarioView(),
            Expanded(
              child: FutureBuilder(
                future: HttpHelper().fetchCategorias(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Categoria> categorias = snapshot.data;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: categorias.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ListarDetalleCategorias(categorias[index]),
                              ));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                  child:
                                      Image.network(categorias[index].urlLogo)),
                              Text(categorias[index].nombre),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerPublicitarioView extends StatefulWidget {
  const BannerPublicitarioView({
    Key key,
  }) : super(key: key);

  @override
  _BannerPublicitarioViewState createState() => _BannerPublicitarioViewState();
}

class _BannerPublicitarioViewState extends State<BannerPublicitarioView> {
  int bannerActual;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpHelper().fetchBannersPublicitarios(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<BannerPublicitario> banners = snapshot.data;
          return Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  onPageChanged: (index, reason) {
                    setState(() {
                      bannerActual = index;
                    });
                  },
                ),
                itemCount: banners.length,
                itemBuilder: (BuildContext context, int itemIndex) => Container(
                  child: Image.network(banners[itemIndex].urlBanner,
                      fit: BoxFit.fill),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banners.map((img) {
                  int indTemp = banners.indexOf(img);
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bannerActual == indTemp
                          ? Colors.black
                          : Colors.black.withOpacity(0.3),
                    ),
                  );
                }).toList(),
              )
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
