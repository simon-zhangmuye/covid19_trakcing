import 'package:covid19_trakcing/constant/constants.dart';
import 'package:covid19_trakcing/model/case.dart';
import 'package:covid19_trakcing/widgets/bottomsheet_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CountryCard extends StatefulWidget {
  final Case countryCase;

  CountryCard(this.countryCase);

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    if (_animation.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Card(
        shape: kCardShape,
        child: ListTile(
          onTap: () {
            return Get.bottomSheet(Container(
              decoration: BoxDecoration(
                color: Color(0XFF14193A),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.countryCase.country,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  BottomsheetDetails(
                    label: 'Total',
                    status: widget.countryCase.cases.total == null
                        ? '0'
                        : NumberFormat.compact()
                            .format(widget.countryCase.cases.total),
                    color: Colors.pink,
                  ),
                  BottomsheetDetails(
                    label: 'New',
                    status: widget.countryCase.cases.casesNew == null
                        ? '0'
                        : widget.countryCase.cases.casesNew,
                    color: Colors.blue,
                  ),
                  BottomsheetDetails(
                    label: 'Active',
                    status: widget.countryCase.cases.active == null
                        ? '0'
                        : NumberFormat.compact()
                            .format(widget.countryCase.cases.active),
                    color: Colors.teal,
                  ),
                  BottomsheetDetails(
                    label: 'Critical',
                    status: widget.countryCase.cases.critical == null
                        ? '0'
                        : NumberFormat.compact()
                            .format(widget.countryCase.cases.critical),
                    color: Colors.orange,
                  ),
                  BottomsheetDetails(
                    label: 'Recovered',
                    status: widget.countryCase.cases.recovered == null
                        ? '0'
                        : NumberFormat.compact()
                            .format(widget.countryCase.cases.recovered),
                    color: Colors.green,
                  ),
                  BottomsheetDetails(
                    label: 'Death',
                    status: widget.countryCase.deaths.total == null
                        ? '0'
                        : NumberFormat.compact()
                            .format(widget.countryCase.deaths.total),
                    color: Colors.red,
                  ),
                ],
              ),
            ));
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/country_flags/${widget.countryCase.country}.png'),
            radius: 25,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.countryCase.country,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${widget.countryCase.cases.total == null ? '0' : NumberFormat.compact().format(widget.countryCase.cases.total)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              Text(
                'Active: ${widget.countryCase.cases.active == null ? '0' : NumberFormat.compact().format(widget.countryCase.cases.active)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
