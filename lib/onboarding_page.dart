import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "images": "assets/images/image1.png",
      "title": "Now reading books will be easier",
      "text": " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
    },
    {
      "images": "assets/images/image2.png",
      "title": "Your Bookish Soulmate Awaits",
      "text": "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
    },
    {
      "images": "assets/images/image3.png",
      "title": "Start Your Adventure",
      "text": "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Column(
        children: [
          // skip button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signin');
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),


          // PageView takes available space
          Expanded(
            child: PageView.builder(
              // connect page controller
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                //  when user scroll page index change
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                //  building each page
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // display image
                    Image.asset(
                      _onboardingData[index]["images"]!,
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 20),

                    // title
                    Text(
                       _onboardingData[index]["title"]!,
                       style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                       ),
                    ),
                    const SizedBox(height: 10),

                    // description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        _onboardingData[index]["text"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                        ),
                    ),
                  ],
                );
              },
            ),
          ),

        //  page indicator (dots under the images / text)


      Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.deepPurple : Colors.grey,
                ),
              ),
            ),
      ),
            const SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Column(
                children: [
                  // Show "Get Started" only on the last page
                  if (_currentPage == _onboardingData.length - 1) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/signup');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Always show "Sign In" button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/signin');
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

           