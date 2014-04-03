//
//  AppDelegate.m
//  TwitterDemo
//


#import "AppDelegate.h"
#import "SocilaViewController.h"

// ****************************************************************************
// TwitterDemo app gives Login with Built.io
// ****************************************************************************

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Sets the api key and application uid of your application
    [Built initializeWithApiKey:@"blt54bb6fddb6a8a4be" andUid:@"photofairapp"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    SocilaViewController *socialVC = [[SocilaViewController alloc]initWithNibName:nil bundle:nil];    
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:socialVC];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
