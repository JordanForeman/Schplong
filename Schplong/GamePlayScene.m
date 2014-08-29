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
#import "VisitablePhysicsBody.h"
#import "ContactVisitor.h"

static const CGFloat contactTolerance = 1.0;

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
	PaddleNode *playerPaddle = [self getPaddle];
	if (playerPaddle.isMoving) {
		[playerPaddle moveTowardsTarget];
	}
	
	BallNode *gameBall = [self getBall];
	if (gameBall.needsServed) {
		[gameBall serveTowardsRight];
		gameBall.needsServed = false;
	}
}

/*=========================
 SKPhysicsContact - Delegate
 ==========================*/
- (void) didBeginContact:(SKPhysicsContact *)contact {
	SKPhysicsBody *firstBody, *secondBody;
	firstBody = contact.bodyA;
	secondBody = contact.bodyB;
	
	// Alternatively use the visitor pattern for a double dispatch approach
    VisitablePhysicsBody *firstVisitableBody = [[VisitablePhysicsBody alloc] initWithBody:firstBody];
    VisitablePhysicsBody *secondVisitableBody = [[VisitablePhysicsBody alloc] initWithBody:secondBody];
    
    [firstVisitableBody acceptVisitor:[ContactVisitor contactVisitorWithBody:secondBody forContact:contact]];
    [secondVisitableBody acceptVisitor:[ContactVisitor contactVisitorWithBody:firstBody forContact:contact]];	
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
	return (PaddleNode *)[self childNodeWithName:@"PlayerPaddle"];
}

- (BallNode *) getBall {
	return (BallNode *)[self childNodeWithName:@"GameBall"];
}

- (BOOL)isPointOnLeftEdge:(CGPoint)point {
    if (floorf(point.x) <= contactTolerance)
        return YES;
    else
        return NO;
}

- (BOOL)isPointOnRightEdge:(CGPoint)point {
    if (ceilf(point.x) >= self.frame.size.width - contactTolerance)
        return YES;
    else
        return NO;
}

@end
