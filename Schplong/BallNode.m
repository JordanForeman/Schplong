//
//  BallNode.m
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "BallNode.h"
#import "SchplongUtil.h"
#import "RandomHelper.h"

@implementation BallNode

@synthesize ballPosition;

+ (instancetype) ballNodeAtPosition:(CGPoint)position {
	BallNode *ballNode = [self node];
	ballNode.ballPosition = position;
	
	CGRect circle = CGRectMake(position.x, position.y,
							   BALL_RADIUS, BALL_RADIUS * 2);
	
	SKShapeNode *ball = [[SKShapeNode alloc] init];
	ball.path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
	ball.fillColor = [SKColor whiteColor];
	ball.lineWidth = 0;
	ball.name = @"Ball";
	
	[ballNode addChild:ball];
	[ballNode setupPhysicsBody];
	ballNode.needsServed = true;
	
	return ballNode;
}

- (void)resetPosition
{
    self.ballPosition = CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMidY(self.scene.frame));
    self.hidden = NO;
}

- (void)serveTowardsRight
{
    [self resetPosition];
    CGFloat direction = skRand(M_PI_4, M_PI_2 + M_PI_4);
    CGFloat magnitude = skRand(300, 400);
    [self setVelocityWithRadians:direction Magnitude:magnitude];
}

- (void)serveTowardsLeft
{
    [self resetPosition];
    CGFloat direction = skRand(M_PI_4, M_PI_2 + M_PI_4);
    CGFloat magnitude = skRand(300, 400);
    [self setVelocityWithRadians:direction Magnitude:magnitude];
}

- (void) setupPhysicsBody {
	self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:BALL_RADIUS center:self.position];
	self.physicsBody.affectedByGravity = NO;
	self.physicsBody.categoryBitMask = CollisionCategoryBall;
	self.physicsBody.collisionBitMask = 0;
	self.physicsBody.contactTestBitMask = CollisionCategoryPaddle;
	self.physicsBody.affectedByGravity = NO;
}

- (void) setVelocityWithRadians:(float)radians Magnitude:(float)magnitude {
	CGFloat horizontalVelocity = magnitude * sin(radians);
	CGFloat	verticalVelocity = magnitude * cos(radians);
	self.physicsBody.velocity = CGVectorMake(horizontalVelocity, verticalVelocity);
}

- (void)reflectVerticalVelocity {
    CGFloat x = self.physicsBody.velocity.dx;
    CGFloat y = -1 * self.physicsBody.velocity.dy;
    self.physicsBody.velocity = CGVectorMake(x,y);
}

- (SKShapeNode *) getBall {
	return (SKShapeNode *)[self childNodeWithName:@"Ball"];
}

@end
