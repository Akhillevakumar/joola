import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_project/widgets/animated_step_count.dart';
import 'package:test_project/widgets/progress_widget.dart';

import '../app_constants/app_data.dart';
import '../widgets/challenge_card_widget.dart';
import '../widgets/text_title.dart';
import '../widgets/user_progress_info.dart';
import '../widgets/video_card_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var imageUrl =
      "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png";
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                   children: [
                    const Icon(
                      Icons.share_outlined,
                      color: Colors.deepPurple,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.deepPurple,
                      size: 32,
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.withOpacity(.1),
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                'https://img.icons8.com/?size=30&id=ApOLCbcm9KeC&format=png&color=fffffff'),
                          ),
                          const Text(
                            "Rewards ",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Greetings of the Day Pam!',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomLeft: Radius.circular(200),
                  ),
                ),
                child: const Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: AnimatedStepProgress(
                          steps: 1200, //   step count
                          totalSteps: 2000, //   total step goal
                          moneyProgress: 0.75, //   money progress
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoWidget(
                            icon: Icons.location_on_rounded,
                            text: '0.1',
                            unit: 'Kms',
                            iconColor: Colors.red,
                          ),
                          InfoWidget(
                            icon: Icons.local_fire_department,
                            text: '190',
                            unit: 'Cal',
                            iconColor: Colors.purpleAccent,
                          ),
                          InfoWidget(
                            icon: Icons.currency_bitcoin,
                            text: '10',
                            unit: 'Coins',
                            iconColor: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                      controller: PageController(),
                      count: 2,
                      effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.grey.withOpacity(.4),
                          activeDotColor: Colors.deepPurple),
                      onDotClicked: (index) {}),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Resume Playing',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
              ),
              VideoCardWidget(
                imageUrl: imageUrl,
                title: 'Grip, Stance, and \nSwing',
                remainingTime: '7 mins',
                progress: 0.7, // 70% completed
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                      controller: PageController(),
                      count: 4,
                      effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.grey.withOpacity(.4),
                          activeDotColor: Colors.deepPurple),
                      onDotClicked: (index) {}),
                ),
              ),
              titleText("Challenges"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: PageView(
                  controller: _pageController,
                  children: List.generate(challengeData.length, (index) {
                    final challenge = challengeData[index];
                    return ChallengeCardWidget(
                      imageUrl: challenge['imageUrl'],
                      challengeTitle: challenge['title'],
                      challengeDates: challenge['dates'],
                      participantCount: challenge['participants'],
                      rating: challenge['rating'],
                      isActive: challenge['isActive'],
                    );
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: challengeData.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey.withOpacity(.4),
                      activeDotColor: Colors.deepPurple,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
              titleText("Achievements"),
              const ProgressCardWidget(
                title: 'Monthly Mania',
                subtitle: 'Walk 100,000 steps',
                progressText: 'completed',
                highlightedProgress: '86%',
                progressValue: 0.86,
                iconData: Icons.directions_walk,
                rewardPoints: 24,
                progressColor: Colors.purple,
              ),
              const ProgressCardWidget(
                title: 'Weekly Wellness Wonder',
                subtitle: 'Meditation 7 in a row',
                progressText: 'completed',
                highlightedProgress: '4 of 7',
                progressValue: 0.57,
                iconData: Icons.self_improvement,
                rewardPoints: 4,
                progressColor: Colors.purple,
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
