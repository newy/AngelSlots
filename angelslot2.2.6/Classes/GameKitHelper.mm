//
//  GameKitHelper.m
//  AngelSlots
//
//  Created by newy on 14-11-5.
//
//

#import <Foundation/Foundation.h>

#import "GameKitHelper.h"
#import "cocos2d.h"
#include "ResouceDefine.h"
@implementation GameKitHelper
@synthesize gameCenterAvailable;

//静态初始化 对外接口
static GameKitHelper *sharedHelper = nil;
static UIViewController* currentModalViewController = nil;
+ (GameKitHelper *) sharedGameKitHelper {
    if (!sharedHelper) {
        sharedHelper = [[GameKitHelper alloc] init];
    }
    return sharedHelper;
}

//用于验证
- (BOOL)isGameCenterAvailable {
    // check for presence of GKLocalPlayer API
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    // check if the device is running iOS 4.1 or later
    NSString *reqSysVer =@"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer
                                           options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
}

- (id)init {
    if ((self = [super init])) {
        gameCenterAvailable = [self isGameCenterAvailable];
        if (gameCenterAvailable) {
            NSNotificationCenter *nc =
            [NSNotificationCenter defaultCenter];
            [nc addObserver:self
                   selector:@selector(authenticationChanged)
                       name:GKPlayerAuthenticationDidChangeNotificationName
                     object:nil];
        }
    }
    return self;
}

//后台回调登陆验证
- (void)authenticationChanged {
    
    if ([GKLocalPlayer localPlayer].isAuthenticated &&!userAuthenticated) {
        NSLog(@"Authentication changed: player authenticated.");
        userAuthenticated = TRUE;
    } else if (![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
        NSLog(@"Authentication changed: player not authenticated");
        userAuthenticated = FALSE;
    }
    
}

- (void)authenticateLocalUser {
    
    if (!gameCenterAvailable) return;
    
    NSLog(@"Authenticating local user...");
    if ([GKLocalPlayer localPlayer].authenticated == NO) {
        [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:nil];
   
    } else {
        NSLog(@"Already authenticated!");
    }
}

//显示排行榜
- (void) showLeaderboard
{
    if (!gameCenterAvailable) return;
    
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil) {
        leaderboardController.leaderboardDelegate = self;
        
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        currentModalViewController = [[UIViewController alloc] init];
        [window addSubview:currentModalViewController.view];
        [currentModalViewController presentModalViewController:leaderboardController animated:YES];
    }
    
}

//关闭排行榜回调
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController{
    if(currentModalViewController !=nil){
        [currentModalViewController dismissModalViewControllerAnimated:NO];
        [currentModalViewController release];
        [currentModalViewController.view removeFromSuperview];
        currentModalViewController = nil;
    }
    
}

//上传分数到排行榜
- (void) reportScore: (int64_t) score forCategory: (NSString*) category
{
    GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:category] autorelease];
    scoreReporter.value = score;
    
    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil)
        {
            NSLog(@"上传分数出错.");
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:false] forKey:@"isMaxscoreUpdate"];
        }
        else
        {
            NSLog(@"上传分数成功");
            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isMaxscoreUpdate"])
            {
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:true] forKey:@"isMaxscoreUpdate"];
            }
            
              NSString *newscore=[NSString stringWithFormat:@"%lld",score/100];
            const char *pLabelStr = ((cocos2d::CCString*)(loacalstrings->objectForKey("newscore")))->m_sString.c_str();
            NSString * strPath = [NSString stringWithUTF8String:pLabelStr];
            [GKNotificationBanner showBannerWithTitle:strPath message:newscore completionHandler:nil];
            // [GKNotificationBanner showBannerWithTitle: title message: message completionHandler:nil];
        }
    }];
}
@end
