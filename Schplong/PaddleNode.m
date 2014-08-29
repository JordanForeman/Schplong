//
//  PaddleNode.m
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "PaddleNode.h"
#import "SchplongUtil.h"

@implementation PaddleNode

+ (instancetype) paddleNodeAtPosition:(CGPoint)position {
	PaddleNode *paddleNode = [self node];
	
	SKShapeNode *paddle = [[SKShapeNode alloc] init];
	CGRect paddleRect = CGRectMake(0, 0, PADDLE_WIDTH, PADDLE_HEIGHT);
	[paddle setPath:CGPathCreateWithRect(paddleRect, nil)];
	[paddle setFillColor:[UIColor whiteColor]];
	paddle.position = position;
	paddle.name = @"Paddle";
	[paddleNode addChild:paddle];
	
	return paddleNode;
}

- (void) startMovingTowardsPosition:(CGPoint)position {
	self.targetDestination = position;
	self.isMoving = true;
	[self moveTowardsTarget];
}

- (void) moveTowardsTarget {
	
	if ([self isInlineWithTarget]) return;
	
	SKShapeNode *paddle = (SKShapeNode *)[self childNodeWithName:@"Paddle"];
	if (paddle.position.y > self.targetDestination.y) {
		paddle.position = CGPointMake(paddle.position.x,
									  paddle.position.y - PLAYER_BASE_PADDLE_SPEED);
	} else {
		paddle.position = CGPointMake(paddle.position.x,
									  paddle.position.y + PLAYER_BASE_PADDLE_SPEED);
	}
}

- (BOOL) isInlineWithTarget {
	SKShapeNode *paddle = (SKShapeNode *)[self childNodeWithName:@"Paddle"];
	return (CGRectGetMinY(paddle.frame) < self.targetDestination.y
			&& CGRectGetMaxY(paddle.frame) > self.targetDestination.y);
}

- (void) stopMoving {
	self.isMoving = false;
}

- (CGPoint)normalisePoint:(CGPoint)point
{
    CGFloat x = point.x / (self.frame.size.width / 2);
    if (x > 1.0)
        x = 1.0;
    else if (x < -1.0)
        x = -1.0;
    
    CGFloat y = point.y / (self.frame.size.height / 2);
    if (y > 1.0)
        y = 1.0;
    else if (y < -1.0)
        y = -1.0;
    
    return CGPointMake(x,y);
}

@end
