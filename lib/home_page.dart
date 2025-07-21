import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _meetingsController;
  late AnimationController _tasksController;
  late AnimationController _habitsController;
  late AnimationController _stepsController;
  late AnimationController _hoursController;
  late AnimationController _minsController;

  late Animation<double> _meetingsAnimation;
  late Animation<double> _tasksAnimation;
  late Animation<double> _habitsAnimation;
  late Animation<double> _stepsAnimation;
  late Animation<double> _hoursAnimation;
  late Animation<double> _minsAnimation;

  bool _hasAnimated = false;
  double _previousRatio = 1.0;
  double _currentBlurRatio = 0.4; // Track current ratio for blur effect

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers with slower duration for more visible effect
    _meetingsController = AnimationController(
      duration: const Duration(milliseconds: 1500), // Increased from 800 to 1500
      vsync: this,
    );
    _tasksController = AnimationController(
      duration: const Duration(milliseconds: 1600), // Increased from 900 to 1600
      vsync: this,
    );
    _habitsController = AnimationController(
      duration: const Duration(milliseconds: 1400), // Increased from 700 to 1400
      vsync: this,
    );
    _stepsController = AnimationController(
      duration: const Duration(milliseconds: 1800), // Increased from 1000 to 1800
      vsync: this,
    );
    _hoursController = AnimationController(
      duration: const Duration(milliseconds: 1700), // Increased from 850 to 1700
      vsync: this,
    );
    _minsController = AnimationController(
      duration: const Duration(milliseconds: 1500), // Increased from 750 to 1500
      vsync: this,
    );

    // Create curved animations with smoother curves
    _meetingsAnimation = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(parent: _meetingsController, curve: Curves.easeOutCubic), // Changed from easeOutExpo to easeOutCubic
    );
    _tasksAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _tasksController, curve: Curves.easeOutCubic),
    );
    _habitsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _habitsController, curve: Curves.easeOutCubic),
    );
    _stepsAnimation = Tween<double>(begin: 0, end: 4.7).animate(
      CurvedAnimation(parent: _stepsController, curve: Curves.easeOutCubic),
    );
    _hoursAnimation = Tween<double>(begin: 0, end: 6.37).animate(
      CurvedAnimation(parent: _hoursController, curve: Curves.easeOutCubic),
    );
    _minsAnimation = Tween<double>(begin: 0, end: 36).animate(
      CurvedAnimation(parent: _minsController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _meetingsController.dispose();
    _tasksController.dispose();
    _habitsController.dispose();
    _stepsController.dispose();
    _hoursController.dispose();
    _minsController.dispose();
    super.dispose();
  }

  void _triggerCounterAnimation(double currentRatio) {
    // Update blur ratio for the blur effect
    setState(() {
      _currentBlurRatio = currentRatio;
    });
    
    // Trigger animation when scrolling down (ratio decreasing) and becoming visible
    if (currentRatio < _previousRatio && currentRatio < 0.8 && !_hasAnimated) {
      _hasAnimated = true;
      
      // Start animations with longer delays for more noticeable staggered effect
      _meetingsController.forward();
      Future.delayed(const Duration(milliseconds: 200), () { // Increased from 100 to 200
        _tasksController.forward();
      });
      Future.delayed(const Duration(milliseconds: 400), () { // Increased from 200 to 400
        _habitsController.forward();
      });
      Future.delayed(const Duration(milliseconds: 600), () { // Increased from 300 to 600
        _stepsController.forward();
      });
      Future.delayed(const Duration(milliseconds: 300), () { // Increased from 150 to 300
        _hoursController.forward();
      });
      Future.delayed(const Duration(milliseconds: 500), () { // Increased from 250 to 500
        _minsController.forward();
      });
    }
    
    // Reset when going back to full screen
    if (currentRatio > 0.9) {
      _hasAnimated = false;
      _meetingsController.reset();
      _tasksController.reset();
      _habitsController.reset();
      _stepsController.reset();
      _hoursController.reset();
      _minsController.reset();
    }
    
    _previousRatio = currentRatio;
  }

  // Calculate blur intensity based on bottom sheet position
  double _calculateBlurIntensity() {
    // Blur is most intense when transitioning from full screen (1.0) to normal (0.4)
    // No blur when at full screen (1.0) or normal position (0.4)
    if (_currentBlurRatio >= 0.9) {
      return 0.0; // No blur at full screen
    } else if (_currentBlurRatio <= 0.45) {
      return 0.0; // No blur at normal position
    } else {
      // Maximum blur around 0.7, fade in/out at edges
      double normalizedRatio = (_currentBlurRatio - 0.45) / (0.9 - 0.45);
      return 8.0 * (1.0 - (normalizedRatio - 0.5).abs() * 2); // Peak at 0.5 normalized
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive font size based on screen width - much larger now
    final responsiveTextSize = screenWidth * 0.055; // Increased from 0.045 to 0.055 (about 5.5% of screen width)
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content with blur effect when transitioning
          Stack(
            children: [
              // Main content with original layout - Fixed height to ensure visibility
              SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55, // Take exactly 55% of screen
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 24, 8, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date and day - original position (NO ANIMATION)
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '09',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 72,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 6, top: 0),
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Jan'24",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Tuesday',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        // Greeting and stats with animated numbers
                        Container(
                          width: screenWidth - 16,
                          child: AnimatedBuilder(
                            animation: Listenable.merge([
                              _meetingsAnimation,
                              _tasksAnimation,
                              _habitsAnimation,
                            ]),
                            builder: (context, child) {
                              return RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: responsiveTextSize.clamp(24.0, 32.0),
                                    height: 1.3,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(text: 'Good morning, '),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundImage: NetworkImage(
                                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
                                          ),
                                          backgroundColor: Colors.orange,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Alexey',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextSpan(text: '.\nYou have '),
                                    TextSpan(text: '📅 '),
                                    WidgetSpan(
                                      child: _buildAnimatedCounter(
                                        _meetingsAnimation,
                                        ' meetings',
                                        TextStyle(
                                          color: Colors.white,
                                          fontSize: responsiveTextSize.clamp(24.0, 32.0),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    TextSpan(text: ',\n'),
                                    TextSpan(text: '☑️ '),
                                    WidgetSpan(
                                      child: _buildAnimatedCounter(
                                        _tasksAnimation,
                                        ' tasks',
                                        TextStyle(
                                          color: Colors.white,
                                          fontSize: responsiveTextSize.clamp(24.0, 32.0),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    TextSpan(text: ' and '),
                                    TextSpan(text: '⭕ '),
                                    WidgetSpan(
                                      child: _buildAnimatedCounter(
                                        _habitsAnimation,
                                        ' habit',
                                        TextStyle(
                                          color: Colors.white,
                                          fontSize: responsiveTextSize.clamp(24.0, 32.0),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    TextSpan(text: '\ntoday. You\'re '),
                                    TextSpan(
                                      text: 'mostly free',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextSpan(text: '\nafter 4 pm.'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Stats with animated numbers
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: AnimatedBuilder(
                              animation: Listenable.merge([
                                _stepsAnimation,
                                _hoursAnimation,
                                _minsAnimation,
                              ]),
                              builder: (context, child) {
                                return Row(
                                  children: [
                                    _buildAnimatedStatItem('🚶', '${_stepsAnimation.value.toStringAsFixed(1)}K steps'),
                                    const SizedBox(width: 24),
                                    _buildAnimatedStatItem('🌙', '${_hoursAnimation.value.toStringAsFixed(1)} hours'),
                                    const SizedBox(width: 24),
                                    _buildAnimatedStatItem('⚡', '${_minsAnimation.value.round()} mins'),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Blur overlay that appears during transition
              if (_calculateBlurIntensity() > 0)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _calculateBlurIntensity(),
                      sigmaY: _calculateBlurIntensity(),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.1), // Slight darkening during blur
                    ),
                  ),
                ),
            ],
          ),
          
          // Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.40, // Changed from 0.45 to 0.40
            minChildSize: 0.40, // Changed from 0.45 to 0.40
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final currentHeight = constraints.maxHeight;
                  final screenHeight = MediaQuery.of(context).size.height;
                  final currentRatio = currentHeight / screenHeight;
                  
                  // Trigger counter animation when scrolling down
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _triggerCounterAnimation(currentRatio);
                  });
                  
                  final borderRadius = currentRatio > 0.9 ? 
                      Radius.circular(32 * (1.0 - ((currentRatio - 0.9) / 0.1))) : 
                      Radius.circular(32);
                  
                  return Stack(
                    children: [
                      // Main bottom sheet container
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: borderRadius,
                            topRight: borderRadius,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                              // Handle bar
                              if (currentRatio < 0.9)
                                Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              
                              // "09" section when almost at full screen - simple appearance
                              if (currentRatio > 0.9)
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.fromLTRB(24, 24, 12, 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '09',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 72,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 6, top: 0),
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Jan'24",
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'Tuesday',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              
                              // Content
                              Expanded(
                                child: ListView(
                                  controller: scrollController,
                                  padding: EdgeInsets.all(currentRatio > 0.9 ? 20 : 24),
                                  children: [
                                    
                                    _buildTaskItem('☀️', 'Wake up', '09:00', true),
                                    _buildDivider(),
                                    _buildTaskItem('💻', 'Design Crit', '10:00', false),
                                    _buildDivider(),
                                    _buildTaskItem('✂️', 'Haircut with Vincent', '13:00', false),
                                    _buildDivider(),
                                    _buildTaskItem('🎉', 'Birthday party', '18:30', false),
                                    _buildDivider(),
                                    _buildTaskItem('🎨', 'Finish designs', '', false),
                                    _buildDivider(),
                                    _buildTaskItem('📝', 'Make posts', '', false),
                                    _buildDivider(),
                                    _buildTaskItem('💪', 'Pushups x100', '', false),
                                    _buildDivider(),
                                    _buildTaskItem('🌙', 'Wind down', '21:00', false),
                                    
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String emoji, String text) {
    return Row(
      children: [
        Text(emoji, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
      ],
    );
  }

  Widget _buildAnimatedStatItem(String emoji, String text) {
    return Row(
      children: [
        Text(emoji, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem(String emoji, String title, String time, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.orange[100] : Colors.grey[100],
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isCompleted ? Colors.orange : Colors.grey[300]!,
                width: 2,
              ),
            ),
            child: isCompleted ? Icon(Icons.check, size: 16, color: Colors.orange) : null,
          ),
          const SizedBox(width: 16),
          Text(emoji, style: TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isCompleted ? Colors.grey[400] : Colors.black,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          if (time.isNotEmpty)
            Text(time, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }

  Widget _buildAnimatedCounter(Animation<double> animation, String suffix, TextStyle style) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final currentValue = animation.value;
        final currentInt = currentValue.floor();
        final nextInt = currentValue.ceil();
        final progress = currentValue - currentInt;
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            // Only the number has the scrolling animation
            SizedBox(
              height: 30,
              width: 15, // Further reduced width for tighter spacing
              child: ClipRect(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Current digit - moves down and fades out
                    Transform.translate(
                      offset: Offset(0, progress * 30),
                      child: Opacity(
                        opacity: 1.0 - progress,
                        child: Text(
                          '$currentInt',
                          style: style,
                        ),
                      ),
                    ),
                    // Next digit - comes from top
                    if (currentInt != nextInt)
                      Transform.translate(
                        offset: Offset(0, (progress - 1) * 30),
                        child: Opacity(
                          opacity: progress,
                          child: Text(
                            '$nextInt',
                            style: style,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // The suffix text remains static (no animation) - closer spacing
            Text(
              suffix,
              style: style,
            ),
          ],
        );
      },
    );
  }
}