//
//  GameKitHelper.h
//  AngelSlots
//
//  Created by newy on 14-11-5.
//
//

#ifndef AngelSlots_GameKitHelper_h
#define AngelSlots_GameKitHelper_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
 
//@interface GameKitHelper :NSObject <GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GKMatchmakerViewControllerDelegate, GKMatchDelegate>{
@interface GameKitHelper :NSObject <GKLeaderboardViewControllerDelegate>{
    BOOL gameCenterAvailable;
    BOOL userAuthenticated;
}

@property (assign, readonly) BOOL gameCenterAvailable;

+ (GameKitHelper *)sharedGameKitHelper;
- (void) authenticateLocalUser;

- (void) showLeaderboard;
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController;
//上传分数到Gamecenter
- (void) reportScore:(int64_t)score forCategory:(NSString*)category;
@end

#endif
