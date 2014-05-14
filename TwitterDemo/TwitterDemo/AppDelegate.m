//
//  AppDelegate.m
//  TwitterDemo
//


#import "AppDelegate.h"
#import "UIElementsLoginViewController.h"
#import "DetailViewController.h"
#import "LoginTableViewController.h"

// ****************************************************************************
// TwitterDemo app gives Login with Built.io
// ****************************************************************************

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Sets the api key and application uid of your application
    [Built initializeWithApiKey:@"blt1a95a895b54dd365" andUid:@"builttwitter"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    BuiltUser *user = [BuiltUser getSession];
    
    if (user != nil) {
        DetailViewController *detailsVC = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
        self.navigationController = [[UINavigationController alloc]initWithRootViewController:detailsVC];
        
    }else{
        LoginTableViewController *loginVC = [[LoginTableViewController alloc]initWithNibName:nil bundle:nil];
        self.navigationController = [[UINavigationController alloc]initWithRootViewController:loginVC];
    }
    
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

+(AppDelegate *)sharedAppDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

@end
