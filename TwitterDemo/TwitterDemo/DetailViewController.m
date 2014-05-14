//
//  DetailViewController.m
//  TwitterDemo
//


#import "DetailViewController.h"
#import "UIElementsLoginViewController.h"
#import "AppDelegate.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "UIImageView+AFNetworking.h"
#import "LoginTableViewController.h"
#import "MBProgressHUD.h"

#define LABEL_WIDTH 320
#define LABEL_HEIGHT 50

@interface DetailViewController (){
    UILabel *userName;
    UILabel *userNameTitle;
}
@property (nonatomic, strong)MBProgressHUD *progressHUD;
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationItem setHidesBackButton:YES];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentUser = [BuiltUser getSession];
    
    NSString *user = [[[[self.currentUser objectForKey:@"auth_data"] objectForKey:@"twitter"] objectForKey:@"user_profile"] objectForKey:@"screen_name"];
    NSLog(@"[self.currentUser objectForKey:@auth_data] %@",[self.currentUser objectForKey:@"auth_data"]);
    userNameTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, LABEL_HEIGHT)];
    [userNameTitle setText:@"Logged User"];
    userNameTitle.textAlignment = NSTextAlignmentCenter;
    [userNameTitle setTextColor:[UIColor blackColor]];
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(130 , 170, 150, 150)];
    [imageView layer].cornerRadius = 10.0f;
    [imageView layer].masksToBounds = YES;
    [imageView setCenter:CGPointMake(self.view.frame.size.width / 2, CGRectGetMaxY(userNameTitle.frame) + 90)];
    NSString *imageURL = [[[[self.currentUser objectForKey:@"auth_data"]objectForKey:@"twitter"]objectForKey:@"user_profile"]objectForKey:@"profile_image_url"];
    imageURL = [imageURL stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
    [imageView setImageWithURL:[NSURL URLWithString:imageURL]];
//    [imageView setImage:[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]]];
    
    
    userName = [[UILabel alloc] init];
    [userName setText:[NSString stringWithFormat:@"@%@",user]];
    [userName setTextAlignment:NSTextAlignmentCenter];
    [userName setBackgroundColor:[UIColor clearColor]];
    [userName setTextColor:[UIColor blackColor]];
    [userName setFrame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height, self.view.frame.size.width,  LABEL_HEIGHT)];
    
    
    
    [self.view addSubview:userNameTitle];
    [self.view addSubview:imageView];
    [self.view addSubview:userName];

}

- (void)logout{
    self.progressHUD = [MBProgressHUD showHUDAddedTo:[AppDelegate sharedAppDelegate].window animated:YES];
    self.progressHUD.dimBackground = YES;
    [self.progressHUD setLabelText:@"Please Wait..."];
    
    BuiltUser *user = [BuiltUser getSession];
    [user clearSession];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.progressHUD hide:YES];
        
        NSMutableArray *vcs =  [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        LoginTableViewController* loginTableViewController = [[LoginTableViewController alloc]initWithNibName:nil bundle:nil];
        [vcs insertObject:loginTableViewController atIndex:0];
        [[AppDelegate sharedAppDelegate].navigationController setViewControllers:vcs animated:NO];
        
        UIViewController *viewController = [[AppDelegate sharedAppDelegate].navigationController.viewControllers objectAtIndex:0];
        [[AppDelegate sharedAppDelegate].navigationController popToViewController:viewController animated:YES];
        
    });
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
