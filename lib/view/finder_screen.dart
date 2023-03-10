import 'package:flutter/material.dart';
import 'package:movies_app_flutter/viewmodel/movie.dart';
import 'package:movies_app_flutter/constants.dart';
import 'package:movies_app_flutter/view/widgets/custom_loading_spin_kit_ring.dart';
import 'package:movies_app_flutter/view/widgets/custom_search_appbar_content.dart';
import 'package:movies_app_flutter/view/widgets/movie_card.dart';
import 'package:movies_app_flutter/view/widgets/movie_card_container.dart';
import 'package:sizer/sizer.dart';

class FinderScreen extends StatefulWidget {
  final Color themeColor;
  FinderScreen({required this.themeColor});
  @override
  _FinderScreenState createState() => _FinderScreenState();
}

class _FinderScreenState extends State<FinderScreen> {
  String textFieldValue = "";
  //for scroll upping
  late ScrollController _scrollController;
  bool showBackToTopButton = false;
  List<MovieCard>? _movieCards;
  bool showLoadingScreen = false;

  Future<void> loadData(String movieName) async {
    MovieModel movieModel = MovieModel();
    _movieCards = await movieModel.searchMovies(
        movieName: movieName, themeColor: widget.themeColor);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          showBackToTopButton = (_scrollController.offset >= 200);
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 18.h,
        title: Text("Finder",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: kSearchAppBarColor,
        shadowColor: Colors.transparent,
        bottom: PreferredSize(
          child: CustomSearchAppbarContent(
              onChanged: (value) => textFieldValue = value,
              onEditingComplete: () {
                if (textFieldValue.length > 0) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showLoadingScreen = true;

                  setState(() {
                    _movieCards = null;
                    loadData(textFieldValue);
                  });
                }
              }),
          preferredSize: Size.zero,
        ),
      ),
      body: (_movieCards == null)
          ? ((showLoadingScreen)
              ? CustomLoadingSpinKitRing(loadingColor: widget.themeColor)
              : null)
          : (_movieCards!.length == 0)
              ? Center(
                  child: Text(
                  "Not found",
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    color: kLightGrey,
                  ),
                ))
              : MovieCardContainer(
                  scrollController: _scrollController,
                  themeColor: widget.themeColor,
                  movieCards: _movieCards!,
                ),

    );
  }
}
