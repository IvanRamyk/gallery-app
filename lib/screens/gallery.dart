import 'package:flutter/material.dart';
import 'package:galleryapp/models/image.dart';
import 'package:galleryapp/screens/image_view.dart';
import 'package:galleryapp/services/unsplash_provider.dart';


class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<UnsplashImage> _images = List();
  var _isLoading = false;

  _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });
    _images = await UnsplashImageProvider.loadImages();
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildImageInfo(UnsplashImage image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Text(
                image.authorName,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            image.description != null ? image.description :
            image.altDescription != null ? image.altDescription : ' ',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSquare(UnsplashImage image) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(24.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Image(
          fit: BoxFit.contain,
          alignment: Alignment.center,
          image: NetworkImage(
              image.smallUrl
          ),
        ),
      ),
    );
  }

  Widget _buildImageItem(BuildContext context, int index) {
    final image = _images[index];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewScreen(image),
            ),
          );
        },
        child: FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 6.0,
              borderRadius: BorderRadius.circular(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _buildImageInfo(image),
                  ),

                  Container(
                    width: 200,
                    height: 200,
                    child: _buildImageSquare(image),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    return ListView.builder(
        itemCount: _images.length,
        itemBuilder: _buildImageItem
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: _buildBody(context),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }
}