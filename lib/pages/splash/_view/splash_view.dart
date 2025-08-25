import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_getx_template/widget/my_button.dart';

class SplashView extends StatelessWidget {
  final VoidCallback onContinuePressed;

  const SplashView({
    super.key,
    required this.onContinuePressed,
  });

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              MyUtils.getImage('img_splash_bg'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildPage1(() {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }),
                  _buildPage2(() {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }),
                  _buildPage3(() {
                    onContinuePressed();
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPage1(VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 260,
            child: Image.asset(
              MyUtils.getImage('img_splash_1'),
              width: double.infinity,
            )
                .animate()
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: 800.ms,
                  curve: Curves.easeOutBack,
                )
                .fadeIn(duration: 600.ms, delay: 200.ms),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 52),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'The AI Way to Learn and Connect',
                    style: MyTextStyles.textWhiteBold(32),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 800.ms, delay: 400.ms).slideY(
                        begin: -0.2,
                        end: 0,
                        duration: 800.ms,
                        delay: 400.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Smarter learning and social discovery, all in one place.',
                    style: MyTextStyles.text(16, color: MyTheme.white.withValues(alpha: 0.5)),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideY(
                        begin: -0.1,
                        end: 0,
                        duration: 800.ms,
                        delay: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MyButton(
                    onPressed: onTap,
                    text: 'Continue',
                    textColor: MyTheme.text_white_block,
                    fontSize: 16,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 800.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 800.ms,
                        delay: 800.ms,
                        curve: Curves.easeOutBack,
                      )
                      .scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.0, 1.0),
                        duration: 600.ms,
                        delay: 800.ms,
                        curve: Curves.elasticOut,
                      ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2(VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 16,
            right: 16,
            top: 260,
            child: Image.asset(
              MyUtils.getImage('img_splash_2'),
              width: double.infinity,
            )
                .animate()
                .slideX(
                  begin: 0.3,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: 800.ms,
                  curve: Curves.easeOutBack,
                )
                .fadeIn(duration: 600.ms, delay: 200.ms),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 52),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Cut Through the Noise, Stay Ahead',
                    style: MyTextStyles.textWhiteBold(32),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 400.ms)
                      .slideY(
                        begin: -0.2,
                        end: 0,
                        duration: 800.ms,
                        delay: 400.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .shimmer(
                        duration: 2000.ms,
                        delay: 1200.ms,
                        color: MyTheme.white.withValues(alpha: 0.3),
                      ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'AI helps you capture all the news & trends that matter.',
                    style: MyTextStyles.text(16, color: MyTheme.white.withValues(alpha: 0.5)),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideY(
                        begin: -0.1,
                        end: 0,
                        duration: 800.ms,
                        delay: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MyButton(
                    onPressed: onTap,
                    text: 'Continue',
                    textColor: MyTheme.text_white_block,
                    fontSize: 16,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 800.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 800.ms,
                        delay: 800.ms,
                        curve: Curves.easeOutBack,
                      )
                      .scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.0, 1.0),
                        duration: 600.ms,
                        delay: 800.ms,
                        curve: Curves.elasticOut,
                      ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage3(VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 260,
            child: Image.asset(
              MyUtils.getImage('img_splash_3'),
              width: double.infinity,
            )
                .animate()
                .slideY(
                  begin: -0.3,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: 800.ms,
                  curve: Curves.easeOutBack,
                )
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .then(delay: 1000.ms)
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .scale(
                  begin: const Offset(1.0, 1.0),
                  end: const Offset(1.02, 1.02),
                  duration: 3000.ms,
                  curve: Curves.easeInOut,
                ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 52),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Discover Friends by What You Love',
                    style: MyTextStyles.textWhiteBold(32),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 400.ms)
                      .slideY(
                        begin: -0.2,
                        end: 0,
                        duration: 800.ms,
                        delay: 400.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .shimmer(
                        duration: 2500.ms,
                        delay: 1200.ms,
                        color: MyTheme.white.withValues(alpha: 0.4),
                      ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Match with like-minded people based on your interests.',
                    style: MyTextStyles.text(16, color: MyTheme.white.withValues(alpha: 0.5)),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideY(
                        begin: -0.1,
                        end: 0,
                        duration: 800.ms,
                        delay: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MyButton(
                    onPressed: onTap,
                    text: 'Get Started',
                    textColor: MyTheme.text_white_block,
                    fontSize: 16,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 800.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 800.ms,
                        delay: 800.ms,
                        curve: Curves.easeOutBack,
                      )
                      .scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.0, 1.0),
                        duration: 600.ms,
                        delay: 800.ms,
                        curve: Curves.elasticOut,
                      )
                      .then(delay: 500.ms)
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .shimmer(
                        duration: 2000.ms,
                        color: MyTheme.white.withValues(alpha: 0.3),
                      ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
