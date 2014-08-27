//
//  GameTitleNode.m
//  Schplong
//
//  Created by Jordan Foreman on 8/26/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "GameTitleNode.h"

@implementation GameTitleNode

+ (instancetype) gameTitleAtPosition:(CGPoint)position {
	GameTitleNode *gameTitle = [self node];
	
	SKLabelNode *gameTitleLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
	gameTitleLabel.name	= @"GameTitle";
	gameTitleLabel.text = @"Schplong!";
	gameTitleLabel.fontSize = 48;
	gameTitleLabel.position = position;
	[gameTitle addChild:gameTitleLabel];
	
	return gameTitle;
}

@end
