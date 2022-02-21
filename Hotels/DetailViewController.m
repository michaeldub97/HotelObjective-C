//
//  DetailViewController.m
//  TestSection
//
//  Created by Михаил on 13.12.2021.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0,0,100,50);
    
    self.detailInfo = [[UILabel alloc] initWithFrame:frame];
    self.detailInfo.center = self.view.center;
    self.view.backgroundColor = [UIColor whiteColor];
    self.detailInfo.backgroundColor = [UIColor redColor];
    self.detailInfo.text = @"Hello";
    [self.view addSubview:self.detailInfo];
    

    
    CGRect buttonFrame = CGRectMake(self.detailInfo.frame.origin.x, (self.detailInfo.frame.origin.y) + 60, 100, 50);
    self.сhangeLabelBatton = [[UIButton alloc] initWithFrame:buttonFrame];
    self.сhangeLabelBatton.backgroundColor = [UIColor blueColor];
    [self.сhangeLabelBatton setTitle:@"Change" forState:UIControlStateNormal];
    [self.view addSubview:self.сhangeLabelBatton];
    
    
    
    
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
