//
//  SocilaViewController.m
//  TwitterDemo
//


#import "UIElementsLoginViewController.h"
#import "DetailViewController.h"
#import "Constants.h"

@interface UIElementsLoginViewController ()

@end

@implementation UIElementsLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.twitterAppSettingDelegate = self;
        self.delegate = self;
        //the login fields which are to be displayed
        self.fields = BuiltLoginFieldTwitter;
        self.shouldHandleLoadingHUD = YES;

        if (iOS_VERSION >= 7) {
            // iOS 7
            self.edgesForExtendedLayout=UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars=NO;
            self.automaticallyAdjustsScrollViewInsets=NO;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
}


#pragma mark
#pragma mark TwitterAppSettingDelegate

-(NSString *)consumerKey{
    //Put twitter consumer_key here
    return @"cWtKD3N9ZbjBoomXvWNRwg";
}

-(NSString *)consumerSecret{
    //Put twitter consumer_secret here
    return @"RWhNyelnMHTfQA5pfpCalASkNlBPlXDrEH9IQeZc";
}

-(void)didClickTwitterButton:(NSError *)error{
    
    UIAlertView *twitterErrorAlert = [[UIAlertView alloc]initWithTitle:@"Twitter Error" message:[[error userInfo] objectForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [twitterErrorAlert show];
}


-(void)loginSuccessWithUser:(BuiltUser *)user{
    if (user) {
        [user removeFromCurrentUser];
    }
    DetailViewController *detailVC = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
    detailVC.currentUser = user;
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(void)loginFailedWithError:(NSError *)error{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
