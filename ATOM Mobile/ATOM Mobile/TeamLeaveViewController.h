//
//  TeamLeaveViewController.h
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/19/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamLeaveViewController : UIViewController <UIScrollViewDelegate> {
    UISegmentedControl *segmentedControl;
    NSInteger selectedSegment;
}

@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *leaveArray;

- (IBAction)segmentSwitch:(id)sender;

@end
