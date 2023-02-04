import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Kred,
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          "Security",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 220,
              width: 380,
              decoration: BoxDecoration(
                color: Kwhite.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.lock_outline,
                          color: Kwhite,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Security of Your Personal Data",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Kred,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Kwhite.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 180,
              width: 380,
              decoration: BoxDecoration(
                color: Kwhite.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.quick_contacts_dialer_outlined,
                          color: Kwhite,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Kred,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "If you have any questions about this Privacy Policy, You can contact us",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Kwhite.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () async {
                        var result = await OpenMailApp.openMailApp(
                          nativePickerTitle: 'Select email app to open',
                        );
                        if (!result.didOpen && !result.canOpen) {
                          // ignore: use_build_context_synchronously
                          showNoMailAppsDialog(context);
                        } else if (!result.didOpen && result.canOpen) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return MailAppPickerDialog(
                                mailApps: result.options,
                              );
                            },
                          );
                        }
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By email: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Kwhite.withOpacity(0.5),
                              ),
                            ),
                            const TextSpan(
                              text: "ibrahimrasith@gmail.com",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Kred,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      // ignore: deprecated_member_use
                      onTap: () => launch('https://ibu-ux.web.app/'),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By website: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Kwhite.withOpacity(0.5),
                              ),
                            ),
                            const TextSpan(
                              text: "https://ibu-ux.web.app/",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Kred,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Open Mail App"),
        content: const Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
