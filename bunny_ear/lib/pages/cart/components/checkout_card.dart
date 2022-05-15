import 'package:bunny_ear/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = new NumberFormat('#,##0.00', 'en_US');

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20.0,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.percent_rounded,
                    color: primaryColor,
                  ),
                ),
                Spacer(),
                Text(
                  'Add voucher code',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'Total:\n',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'THB ${format.format(39990)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: primaryColor.withOpacity(0.8),
                      padding: EdgeInsets.all(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.check_outlined,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}