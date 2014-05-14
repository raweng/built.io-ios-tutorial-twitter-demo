//
//  LoginTableViewController.m
//  BuiltTwitterLogin
//
//  Created by Sameer on 14/05/14.
//  Copyright (c) 2014 raweng. All rights reserved.
//

#import "LoginTableViewController.h"
#import "LoginViewController.h"
#import "UIElementsLoginViewController.h"

@interface LoginTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)NSArray *loginOptions;

@end

@implementation LoginTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginOptions = [NSArray arrayWithObjects:@"Login Using Twitter UI Element", @"Login via Twitter ACAccount", nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
//    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection %d",self.loginOptions.count);
    // Return the number of rows in the section.
    return self.loginOptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath %d",indexPath.row);
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSLog(@"celllllllllll %@",cell);
    
    cell.textLabel.text = [self.loginOptions objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectRowAtIndexPath %d",indexPath.row);
    
    if (indexPath.row == 0) {
        UIElementsLoginViewController *uieleloginVC = [[UIElementsLoginViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:uieleloginVC animated:YES];
    }else{
        LoginViewController *loginVC = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end