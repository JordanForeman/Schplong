//
//  SchplongUtil.h
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

static const int PADDLE_WIDTH = 5;
static const int PADDLE_HEIGHT = 60;

static const int BALL_RADIUS = 10;

static const int GAME_BOARD_PADDING = 10;

static const int PLAYER_BASE_PADDLE_SPEED = 40;
static const int COMPUTER_BASE_PADDLE_SPEED = 40;
static const int BASE_BALL_SPEED = 10;

typedef NS_OPTIONS(uint32_t, CollisionCategory) {
	CollisionCategoryBall = 1 << 0,		// 0000
	CollisionCategoryPaddle = 1 << 1,	// 0010
	CollisionCategoryGoal = 1 << 2,		// 0100
	CollisionCategoryField = 1 << 3,	// 1000
};

@interface SchplongUtil : NSObject

+ (SKShapeNode *) getFullColorBackground:(UIColor *)color forFrame:(CGRect)frame;
+ (CGFloat) skRandForLow:(CGFloat *)low andHigh:(CGFloat *)high;
+ (CGFloat) skRandf;

@end
