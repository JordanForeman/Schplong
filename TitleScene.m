//
//  TitleScene.m
//  Schplong
//
//  Created by Jordan Foreman on 8/25/14.
//  Copyright (c) 2014 Better Than Great. All rights reserved.
//

#import "TitleScene.h"
#import "SchplongUtil.h"
#import "GameTitleNode.h"
#import "GamePlayScene.h"

@implementation TitleScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
		/* Setup your scene here */
		[self setupBackground];
		[self setupLabels];
		[self setupSoundEffects];
		[self setupBackgroundMusic];
    }
    return self;
}

/*=================================
 Scene Setup
 =================================*/
- (void) setupBackground {
	SKShapeNode *background = [SchplongUtil getFullColorBackground:[UIColor blackColor]
													   forFrame:self.frame];
	[self addChild:background];
}

- (void) setupLabels {
	GameTitleNode *gameTitle = [GameTitleNode gameTitleAtPosition:CGPointMake(CGRectGetMidX(self.frame),
																			  CGRectGetMidY(self.frame))];
	[self addChild:gameTitle];
}

- (void) setupBackgroundMusic {
	
//	NSURL *url = [[NSBundle mainBundle] URLForResource:@"StartScreen" withExtension:@"mp3"];
//	self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//	self.backgroundMusic.numberOfLoops = -1; // Play infinitely
//	[self.backgroundMusic prepareToPlay];
	
}

- (void) setupSoundEffects {
//	self.pressStartSFX = [SKAction playSoundFileNamed:@"PressStart.caf" waitForCompletion:NO];
}


/*=================================
 SKScene Implementation
 =================================*/
- (void) didMoveToView:(SKView *)view {
//	[self.backgroundMusic play];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//	[self.backgroundMusic stop];
//	[self runAction:self.pressStartSFX];
//    BTGGamePlayScene *gamePlayScene = [BTGGamePlayScene sceneWithSize:self.frame.size];
	GamePlayScene *gamePlayScene = [GamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}

@end
