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
	playerPaddle.name = @"PlayerPaddle";
	[self addChild:playerPaddle];
}

- (void) setupBall {
	BallNode *ball = [BallNode ballNodeAtPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
	
	ball.name = @"GameBall";
	[self addChild:ball];
}

/*======================
 SKScene Implementation
 =======================*/
- (void) didMoveToView:(SKView *)view {
	
}

- (void) update:(NSTimeInterval)currentTime {
	PaddleNode *playerPaddle = (PaddleNode *)[self childNodeWithName:@"PlayerPaddle"];
	if (playerPaddle.isMoving) {
		[playerPaddle moveTowardsTarget];
	}
}

/*=======================
 Touch Events
 ========================*/
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint positionInScene = [touch locationInNode:self];
	
	PaddleNode *playerPaddle = (PaddleNode *)[self childNodeWithName:@"PlayerPaddle"];
	[playerPaddle startMovingTowardsPosition:positionInScene];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	PaddleNode *playerPaddle = (PaddleNode *)[self childNodeWithName:@"PlayerPaddle"];
	playerPaddle.isMoving = false;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
	PaddleNode *playerPaddle = (PaddleNode *)[self childNodeWithName:@"PlayerPaddle"];
	playerPaddle.targetDestination = [touch locationInNode:self];
}

@end
