//
//  GamePlayScene.m
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "GamePlayScene.h"
#import "SchplongUtil.h"
#import "PaddleNode.h"
#import "BallNode.h"

@implementation GamePlayScene

- (id) initWithSize:(CGSize)size {
	if (self = [super initWithSize:size]) {
		// Setup scene here
		[self setupBackground];
		[self setupPaddles];
		[self setupBall];
	}
	return self;
}

/*===================
 Setup Logic
 ====================*/
- (void) setupBackground {
	SKShapeNode	*background = [SchplongUtil getFullColorBackground:[UIColor cyanColor] forFrame:self.frame];
	[self addChild:background];
}

- (void) setupPaddles {
	PaddleNode *playerPaddle = [PaddleNode paddleNodeAtPosition:CGPointMake(GAME_BOARD_PADDING,
																			CGRectGetMidY(self.frame))];
	playerPaddle.name = PLAYER_PADDLE_NAME;
	[self addChild:playerPaddle];
}

- (void) setupBall {
	BallNode *ball = [BallNode ballNodeAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
	
	ball.name = GAME_BALL_NAME;
	[self addChild:ball];
}

/*======================
 SKScene Implementation
 =======================*/
- (void) didMoveToView:(SKView *)view {
	
}

- (void) update:(NSTimeInterval)currentTime {
	PaddleNode *playerPaddle = [self getPaddle];
	if (playerPaddle.isMoving) {
		[playerPaddle moveTowardsTarget];
	}
}

/*=======================
 Touch Events
 ========================*/
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	PaddleNode *playerPaddle = [self getPaddle];
	CGPoint positionInScene = [touch locationInNode:self];
	[playerPaddle startMovingTowardsPosition:positionInScene];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	PaddleNode *playerPaddle = [self getPaddle];
	playerPaddle.isMoving = false;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	PaddleNode *playerPaddle = [self getPaddle];
	
	playerPaddle.targetDestination = [touch locationInNode:self];
}

/*=========================
 Convenience
 ==========================*/
- (PaddleNode *) getPaddle {
	return (PaddleNode *)[self childNodeWithName:PLAYER_PADDLE_NAME];
}

- (BallNode *) getBall {
	return (BallNode *)[self childNodeWithName:GAME_BALL_NAME];
}

@end
