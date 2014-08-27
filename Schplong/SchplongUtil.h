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

static const int BALL_RADIUS = 50;

static const int GAME_BOARD_PADDING = 10;

static const int PLAYER_BASE_PADDLE_SPEED = 40;
static const int COMPUTER_BASE_PADDLE_SPEED = 40;
static const int BASE_BALL_SPEED = 10;

@interface SchplongUtil : NSObject

+(SKShapeNode *)getFullColorBackground:(UIColor *)color forFrame:(CGRect)frame;

@end
