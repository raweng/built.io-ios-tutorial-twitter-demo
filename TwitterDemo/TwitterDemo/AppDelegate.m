//
//  AppDelegate.m
//  TwitterDemo
//


#import "AppDelegate.h"
#import "UIElementsLoginViewController.h"
#import "DetailViewController.h"
#import "LoginTableViewController.h"

// ****************************************************************************
// TwitterDemo app gives Login with Built.io Backend
// ****************************************************************************

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Sets the api key of your application
    self.bltApplication = [Built applicationWithAPIKey:@"blt1a95a895b54dd365"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    BuiltUser *user = [self.bltApplication currentUser];
    
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
