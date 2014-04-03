//
//  SocilaViewController.m
//  TwitterDemo
//


#import "SocilaViewController.h"
#import "DetailViewController.h"

@interface SocilaViewController ()

@end

@implementation SocilaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.twitterAppSettingDelegate = self;
        self.delegate = self;
        //the login fields which are to be displayed
        self.fields = BuiltLoginFieldTwitter;
        self.shouldHandleLoadingHUD = YES;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark
#pragma mark TwitterAppSettingDelegate

-(NSString *)consumerKey{
    //Put twitter consumer_key here
    return @"6HcjyZmhuzROqGxSzjH4Q";
}

-(NSString *)consumerSecret{
    //Put twitter consumer_secret here
    return @"pn2M82Cp4SB091SpanVJf8yTZDUgGtcSJhz4jCD450";
}

-(void)didClickTwitterButton:(NSError *)error{
    
    UIAlertView *twitterErrorAlert = [[UIAlertView alloc]initWithTitle:@"Twitter Error" message:[[error userInfo] objectForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [twitterErrorAlert show];
}


-(void)loginSuccessWithUser:(BuiltUser *)user{
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
