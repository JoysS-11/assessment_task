import 'package:flutter/material.dart';

import '../../model/user_view_model.dart';

class UserDetailCard extends StatefulWidget {
  const UserDetailCard({
    super.key,
    this.userDetails,
    this.index,
  });
  final UserViewModel? userDetails;
  final int? index;

  @override
  State<UserDetailCard> createState() => _UserDetailCardState();
}

class _UserDetailCardState extends State<UserDetailCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(size.height * 0.015),
      margin: EdgeInsets.fromLTRB(
          size.height * 0.015,
          widget.index == 0 ? size.height * 0.015 : 0,
          size.height * 0.015,
          size.height * 0.015),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(size.height * 0.015),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headText("${widget.userDetails!.name}"),
          smallText(widget.userDetails!.username.toString()),
          smallText(widget.userDetails!.email.toString()),
          rowText(
            "${widget.userDetails!.phone}".toString(),
            Icons.phone,
            () {},
          ),
          rowText(
            "${widget.userDetails!.address!.suite}, ${widget.userDetails!.address!.street}, ${widget.userDetails!.address!.city} - ${widget.userDetails!.address!.zipcode}"
                .toString(),
            Icons.location_on,
            () {},
          ),
          rowText(
            "${widget.userDetails!.website}".toString(),
            Icons.public,
            () {},
          ),
        ],
      ),
    );
  }

  InkWell rowText(String text, IconData icon, Function() onTap) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: size.height * 0.012,
            color: Colors.black,
          ),
          SizedBox(width: size.height * 0.005),
          Expanded(
            child: smallText(text),
          ),
        ],
      ),
    );
  }

  Text headText(String text) {
    Size size = MediaQuery.of(context).size;
    return Text(
      text,
      overflow: TextOverflow.visible,
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.016,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text smallText(String text) {
    Size size = MediaQuery.of(context).size;
    return Text(
      text,
      overflow: TextOverflow.visible,
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.012,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
