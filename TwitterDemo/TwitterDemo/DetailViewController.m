//
//  DetailViewController.m
//  TwitterDemo
//


#import "DetailViewController.h"
#define LABEL_WIDTH 320
#define LABEL_HEIGHT 50

@interface DetailViewController (){
    UILabel *userName;
    UILabel *userNameTitle;
}

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *user = [[[[self.currentUser objectForKey:@"auth_data"] objectForKey:@"twitter"] objectForKey:@"user_profile"] objectForKey:@"screen_name"];
    userNameTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, LABEL_WIDTH, LABEL_HEIGHT)];
    [userNameTitle setText:@"Logged User"];
    [userNameTitle setTextAlignment:NSTextAlignmentCenter];
    [userNameTitle setBackgroundColor:[UIColor clearColor]];
    [userNameTitle setTextColor:[UIColor blackColor]];
    [self.view addSubview:userNameTitle];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(130 , 170, 50, 50)];
    [imageView setImage:[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[[self.currentUser objectForKey:@"auth_data"] objectForKey:@"twitter"] objectForKey:@"user_profile"] objectForKey:@"profile_image_url"]]] ]];
    [self.view addSubview:imageView];
    
    userName = [[UILabel alloc] init];
    [userName setText:[NSString stringWithFormat:@"@%@",user]];
    [userName setTextAlignment:NSTextAlignmentCenter];
    [userName setBackgroundColor:[UIColor clearColor]];
    [userName setTextColor:[UIColor blackColor]];
    [userName setFrame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height, LABEL_WIDTH,  LABEL_HEIGHT)];
    [self.view addSubview:userName];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
