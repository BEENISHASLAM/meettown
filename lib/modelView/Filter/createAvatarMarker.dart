import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MarkerHelper {
  // Load an image from a URL and convert it into a circular BitmapDescriptor
  Future<BitmapDescriptor> createCircularAvatarMarkerFromUrl(String imageUrl) async {
    final http.Response response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final Uint8List markerImageBytes = response.bodyBytes;
      final Completer<BitmapDescriptor> completer = Completer();

      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
        markerImageBytes,
        targetWidth: 60, // Set desired size
        targetHeight: 60, // Set desired size
      );
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ui.Image image = frameInfo.image;

      final pictureRecorder = ui.PictureRecorder();
      final canvas = Canvas(pictureRecorder);
      final paint = Paint()..isAntiAlias = true;

      final radius = 60.0; // Set the radius for the circular avatar

      // Draw a circle
      canvas.drawCircle(
        Offset(radius, radius),
        radius,
        paint,
      );

      // Draw the image inside the circle
      paint.blendMode = BlendMode.srcIn; // This will only show the image within the circle
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(0, 0, 2 * radius, 2 * radius),
        paint,
      );

      // Convert the canvas to an image
      final ui.Image circularImage = await pictureRecorder.endRecording().toImage(120, 120);
      final ByteData? byteData = await circularImage.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();

      // Return the BitmapDescriptor
      completer.complete(BitmapDescriptor.fromBytes(resizedMarkerImageBytes));
      return completer.future;
    } else {
      throw Exception("Failed to load image.");
    }
  }
}
