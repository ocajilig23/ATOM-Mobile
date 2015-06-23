//
//  ShiftDetailsViewController.h
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/19/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShiftDetailsViewController : UIViewController <UIScrollViewDelegate> {
    UISegmentedControl *segmentedControl;
    UITextField *firstTextField;
    UITextField *secondTextField;
    UIButton *selectedButton;
    NSInteger selectedSegment;
}

@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) IBOutlet UITextField *firstTextField;
@property (nonatomic, strong) IBOutlet UITextField *secondTextField;
@property (nonatomic, strong) IBOutlet UIButton *selectedButton;
@property (nonatomic, strong) NSArray *attendanceArray;
@property (nonatomic, strong) NSArray *shiftTableArray;

- (IBAction)segmentSwitch:(id)sender;

@end
