//
//  LoginViewController.m
//  BuiltTwitterLogin

#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import <Accounts/Accounts.h>
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()
@property (nonatomic, strong)MBProgressHUD *progressHUD;
@end

@implementation LoginViewController

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
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setFrame:CGRectMake(0, 0, 200, 65)];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor colorWithRed:.196 green:0.3098 blue:0.52 alpha:1.0] forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont boldSystemFontOfSize:30.0]];
    [loginButton setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
    // Do any additional setup after loading the view.
}

- (void)login{
    self.progressHUD = [MBProgressHUD showHUDAddedTo:[AppDelegate sharedAppDelegate].window animated:YES];
    self.progressHUD.dimBackground = YES;
    [self.progressHUD setLabelText:@"Please wait..."];
    
    BuiltUser *user = [BuiltUser user];
    
    ACAccountStore *accStore = [[ACAccountStore alloc]init];
    ACAccountType *accType = [accStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [accStore requestAccessToAccountsWithType:accType options:nil completion:^(BOOL granted, NSError *error) {
        if (granted == YES) {
            NSArray *arrayOfAccounts = [accStore
                                        accountsWithAccountType:accType];
            
            if ([arrayOfAccounts count] > 0)
            {
                ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                [user loginWithTwitterAccount:twitterAccount consumerKey:@"cWtKD3N9ZbjBoomXvWNRwg" consumerSecret:@"RWhNyelnMHTfQA5pfpCalASkNlBPlXDrEH9IQeZc" onSuccess:^{
                    [self.progressHUD setLabelText:@"Login Successful!!"];
                    [self.progressHUD hide:YES afterDelay:1.0];
                    
                    [user saveSession];
                    
                    DetailViewController *detailsVC = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
                    [self.navigationController pushViewController:detailsVC animated:YES];
                    
                } onError:^(NSError *error) {
                    [self.progressHUD setLabelText:@"Login Failed!!"];
                    [self.progressHUD hide:YES afterDelay:1.0];
                }];
            }else{
                [self.progressHUD setLabelText:@"No Twitter Account Exists in Settings"];
                [self.progressHUD hide:YES afterDelay:1.0];
            }
        }else{
            [self.progressHUD setLabelText:@"Login Failed!!"];
            [self.progressHUD hide:YES afterDelay:1.0];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
