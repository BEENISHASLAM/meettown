import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/comments.dart';
import 'package:meettown/view/BottomNavbar/Drawer.dart';
import 'package:meettown/view/profile_view/profile_view.dart';

class Post {
  final String userName;
  final String userImageUrl;
  final String postContent;
  final String PostImage;
  final String Like;

  Post(
      {required this.userName,
      required this.userImageUrl,
      required this.postContent,
      required this.PostImage,
      required this.Like
      });
}

// class FeedPage extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Feeds'),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         backgroundColor: appColors.textBlueColor,
//       ),
//       drawer: MyDrawer(),
//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return PostItem(post: posts[index]);
//         },
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
class PostItem extends StatefulWidget {
  var post;

  PostItem({required this.post});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final GlobalKey _likeButtonKey = GlobalKey();

  OverlayEntry? _overlayEntry;



  void _showReactions(BuildContext context) {
    final renderBox = _likeButtonKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx - 10,
        top: offset.dy - size.height - 60,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up, color: Colors.blue),
                  onPressed: () {
                    _overlayEntry?.remove();
                    widget.post["isLike"]="Like";
                    setState(() {
                      
                    });
                    print('Liked');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    _overlayEntry?.remove();
                    widget.post["isLike"]="Loved";
                         setState(() {
                      
                    });

                    print('Loved');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_very_satisfied, color: Colors.yellow),
                  onPressed: () {
                    _overlayEntry?.remove();
                    widget.post["isLike"]="Haha";
                    setState(() {
                      
                    });

                    print('Haha');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_dissatisfied, color: Colors.orange),
                  onPressed: () {
                    _overlayEntry?.remove();
                       widget.post["isLike"]="Sad";
                            setState(() {
                      
                    });
                    print('Sad');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.redAccent),
                  onPressed: () {
                    _overlayEntry?.remove();
                    print('Angry');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: const Color.fromARGB(255, 255, 255, 255),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: (){
                 Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileView(
                    name: widget.post["username"],
                  )));
              },
              child: CachedNetworkImage(
                imageUrl: widget.post["userImage"].toString(),
                placeholder: (context, url) => CircleAvatar(
                  radius: 30,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.error),
                ),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 30,
                ),
              ),
            ),
            title: Text(
              widget.post["username"],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on),
               
                Text(widget.post["address"])
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                '  Moment  ',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: appColors.textBlueColor,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CachedNetworkImage(
              imageUrl: widget.post["postImage"],
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                width: double.infinity,
              ),
              placeholder: (context, url) => Container(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.post["text"],
              style: TextStyle(
                  color: appColors.textBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text('celibataire'),
          ),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
              key: _likeButtonKey,
              onTap: () {
                _showReactions(context);
              },
              child: Icon(
                widget.post["isLike"]== "Like"?
                Icons.thumb_up:
                  widget.post["isLike"]== "Loved"?
                Icons.favorite:
                  widget.post["isLike"]== "Sad"?
                Icons.sentiment_dissatisfied:
                  widget.post["isLike"]== "Angry"?
                Icons.sentiment_very_dissatisfied:
                  widget.post["isLike"]== "Haha"?
                Icons.sentiment_very_satisfied:
                Icons.favorite
                
                , color:  widget.post["isLike"] == "Like" ? Colors.blue:
                 widget.post["isLike"]== "Loved" ? Colors.red:
                  widget.post["isLike"]== "Sad" ? Colors.yellow:
                
                 widget.post["isLike"]== "Angry" ? const Color.fromARGB(255, 86, 3, 3):
                 Colors.blue
                ),
            ),
             
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: appColors.textBlueColor,
                ),
                onPressed: () {
                showModalBottomSheet(
                  
              context: context,
              isScrollControlled: true,
              builder: (context) => Container(
                margin: EdgeInsets.all(10),
                height: 300,
                child: CommentSheetDemo()),
            );
                  // Handle comment button pressed
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: appColors.textBlueColor,
                ),
                onPressed: () {
                  // Handle share button pressed
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
