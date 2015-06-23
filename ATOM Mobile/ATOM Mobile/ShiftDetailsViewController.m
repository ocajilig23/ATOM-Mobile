//
//  ShiftDetailsViewController.m
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/19/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "ShiftDetailsViewController.h"

@interface ShiftDetailsViewController ()

@end

@implementation ShiftDetailsViewController

@synthesize scrollView, pageControl, attendanceArray, segmentedControl, shiftTableArray;
@synthesize firstTextField, secondTextField, selectedButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIColor whiteColor], NSBackgroundColorAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.navigationItem.title = @"Shift Details";
    
    // left bar button
    UIButton *globalFilterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    globalFilterButton.frame = CGRectMake(0, 0, 30, 30);
    [globalFilterButton setImage:[UIImage imageNamed:@"global-filter.png"] forState:UIControlStateNormal];
    [globalFilterButton addTarget:self action:@selector(globalFilterButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *globalFilter = [[UIBarButtonItem alloc] initWithCustomView:globalFilterButton];
    self.navigationItem.leftBarButtonItem = globalFilter;
    // right bar button
    UIButton *profileIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    profileIconButton.frame = CGRectMake(0, 0, 30, 30);
    [profileIconButton setImage:[UIImage imageNamed:@"profile.png"] forState:UIControlStateNormal];
    [profileIconButton addTarget:self action:@selector(profileIconButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *profileIcon = [[UIBarButtonItem alloc] initWithCustomView:profileIconButton];
    self.navigationItem.rightBarButtonItem = profileIcon;
    
    segmentedControl.selectedSegmentIndex = selectedSegment;
    [self segmentSwitch:segmentedControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1;
    self.pageControl.currentPage = page;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)globalFilterButtonClicked:(id)sender
{
    
}

- (void)profileIconButtonClicked:(id)sender
{
    
}

- (IBAction)segmentSwitch:(id)sender
{
    segmentedControl = (UISegmentedControl *)sender;
    selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        firstTextField.placeholder = @"Start Date";
        secondTextField.placeholder = @"End Date";
        UIImage *buttonImage = [UIImage imageNamed:@"go-btn.png"];
        [selectedButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        attendanceArray = [[NSArray alloc] initWithObjects:@"attendance_page1.png", @"attendance_page2.png", nil];
        
        for (int i=0; i < [attendanceArray count]; i++) {
            CGRect frame;
            frame.origin.x = self.scrollView.frame.size.width * i;
            frame.origin.y = 0;
            frame.size = self.scrollView.frame.size;
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
            imageView.image = [UIImage imageNamed:[attendanceArray objectAtIndex:i]];
            [self.scrollView addSubview:imageView];
        }
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [attendanceArray count], scrollView.frame.size.height);
    } else {
        firstTextField.placeholder = @"Select Date";
        secondTextField.placeholder = @"Select Shift";
        UIImage *buttonImage = [UIImage imageNamed:@"generate-btn.png"];
        [selectedButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        UITableView *firstTable = [[UITableView alloc] init];
        UITableView *secondTable = [[UITableView alloc] init];
        
        shiftTableArray = [[NSArray alloc] initWithObjects:firstTable, secondTable, nil];
        
        for (int i=0; i < [shiftTableArray count]; i++) {
            CGRect frame;
            frame.origin.x = self.scrollView.frame.size.width * i;
            frame.origin.y = 0;
            frame.size = self.scrollView.frame.size;
            
            UIView *view = [shiftTableArray objectAtIndex:i];
            view.frame = frame;
            
            [self.scrollView addSubview:view];
        }
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [shiftTableArray count], scrollView.frame.size.height);
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
