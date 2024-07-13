import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafill_test/core/colors.dart';
import 'package:kafill_test/core/typography.dart';

import '../models/service.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Services',
            style: AppTypography.appBarText,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: generateDummyServices().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ServicesCard(service: generateDummyServices()[index]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Popular Services',
            style: AppTypography.appBarText,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: generateDummyServices().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ServicesCard(service: generateDummyServices()[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ServicesCard extends StatelessWidget {
  final ServiceModel service;

  const ServicesCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          height: 192,
          width: 157,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              const ServicePhoto(),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  service.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.servicesName,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Color(0xFFFFCB31),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('(${service.rate})',
                      style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFFFCB31))),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('|',
                      style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFC3C5C8))),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    FontAwesomeIcons.basketShopping,
                    size: 20,
                    color: Color(0xFF828282),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${service.numberOfPeople}',
                      style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF828282))),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ServicePhoto extends StatelessWidget {
  const ServicePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image(
              image: NetworkImage(
                  'https://s3-alpha-sig.figma.com/img/c47b/71a8/33dc8b9a17c1e54f71da6680673dc9da?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bUjg-0DcazW6DRq5yMGYYASChHYPZ99pMUtvvH5hE6JZEjzZXZVPBzxzV~NUJRxee0NKtmCBezfxnrM6k-k-7lCB46iQRgjdR~egh-NIUplmfHk5GAw90SKzxgF5lZvCUnud4ML788-dcqVUGfKPfow4AqchnCv6knc0Rp4s3~5g7XEdvVJSlOJUcf-asWdv5tUjvHF1cBDjq4QFH1u2ZzZTMb~vpHAns5yQraBkzCH9cEK3eH7ghM5r69kjdM-Xk4q9Q-WYnh2QA65dMEeOcj5VuwnN7QW1sj6m5Hji00CkMYHaSqDo-2RP8D14Mli7DiQZu-4Z16KuTtSpijhjfA__')),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60,
              height: 26,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(27)),
                  color: AppColors.primaryColor),
              child: Center(
                child: Text(
                  '100',
                  style: AppTypography.servicesText,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
