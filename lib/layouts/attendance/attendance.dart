import 'dart:async';

import 'package:fab_hr/layouts/common_screens/constants_widgets.dart';
import 'package:fab_hr/utils/app_colors.dart';
import 'package:fab_hr/utils/common_fontstyle.dart';
import 'package:fab_hr/utils/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AttendanceScreen extends StatefulWidget {
  static const String route = 'AttendanceScreen';
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool login = false;
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> markers = Set();
  LatLng currentPosition = LatLng(37.42796133580664, -122.085749655962);

  @override
  initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Set<Marker> getmarkers() {
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: const MarkerId(''),
        position: currentPosition, //position of marker
        infoWindow: const InfoWindow(
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return markers;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Attendance',
          style: FontStyleGoogle.bold(AppColors.appThemeDark).s18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
              onTap: null,
              child: GradientIcon(
                SvgPicture.asset(
                  'assets/icons/notification_icon.svg',
                  color: AppColors.whiteColor,
                ),
                20.0,
                [
                  Colors.red,
                  Colors.yellow.shade600,
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 370,
                    width: getSize(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: currentPosition,
                          zoom: 14.4746,
                        ),
                        markers: getmarkers(),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Container(
                        height: getSize(context).height * 0.08,
                        width: getSize(context).width * 0.5,
                        decoration: BoxDecoration(
                          color: login
                              ? AppColors.appThemeLight
                              : AppColors.greenColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientIcon(
                              SvgPicture.asset(
                                login
                                    ? 'assets/icons/logout_icon.svg'
                                    : 'assets/icons/fingerprint_icon.svg',
                                color: Colors.white,
                              ),
                              30.0,
                              const [
                                Colors.red,
                                Colors.yellow,
                              ],
                            ),
                            sizedBoxShow(width: 10),
                            Text(
                              login ? 'Logout' : 'Login',
                              style: FontStyleGoogle.bold(AppColors.whiteColor)
                                  .s20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
