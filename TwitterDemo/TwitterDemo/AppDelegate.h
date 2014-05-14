//
//  AppDelegate.h
//  TwitterDemo
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;

+(AppDelegate *)sharedAppDelegate;


@end
