//
//  DetailHotelController.m
//  Hotel
//
//  Created by Михаил on 22.12.2021.
//

#import "DetailHotelController.h"
#import <HCSStarRatingView/HCSStarRatingView.h>
#import "ScrollTablePhotoHotel.h"
#import "MainInfoHotelCell.h"
#import "DescriptionHotelCell.h"
#import "ContactInfoItemView.h"

@interface DetailHotelController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) HCSStarRatingView* starDetailValue;

@end

@implementation DetailHotelController



- (void) viewDidLoad {
    [super viewDidLoad];
    self.detailInfoTableView = [[UITableView alloc] init];
    [self.detailInfoTableView setTranslatesAutoresizingMaskIntoConstraints:false];
    
    self.detailInfoTableView.delegate = self;
    self.detailInfoTableView.dataSource = self;
    self.detailInfoTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.detailInfoTableView registerClass:[ScrollTablePhotoHotel class] forCellReuseIdentifier:@"CellPhotoHotel"];
    [self.detailInfoTableView registerClass:[MainInfoHotelCell class] forCellReuseIdentifier:@"CellMainInfo"];
    [self.detailInfoTableView registerClass:[DescriptionHotelCell class] forCellReuseIdentifier:@"CellDescriptionHotel"];
    
    [self.view addSubview:self.detailInfoTableView];
    
    [self setupdetailInfoTableViewConstraint];
}

- (void)setupdetailInfoTableViewConstraint {
    NSLayoutConstraint *topDetailInfoTableView = [NSLayoutConstraint constraintWithItem:self.detailInfoTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bottomDetailInfoTableView = [NSLayoutConstraint constraintWithItem:self.detailInfoTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *leftDetailInfoTableView = [NSLayoutConstraint constraintWithItem:self.detailInfoTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *rightDetailInfoTableView = [NSLayoutConstraint constraintWithItem:self.detailInfoTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    [self.view addConstraints:@[topDetailInfoTableView, bottomDetailInfoTableView, leftDetailInfoTableView, rightDetailInfoTableView]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            ScrollTablePhotoHotel *cellPhotoHotel = [tableView dequeueReusableCellWithIdentifier:@"CellPhotoHotel" forIndexPath:indexPath];
            [cellPhotoHotel loadData:self.hotel.images];
            return cellPhotoHotel;
        }
            break;
        case 1:
        {
            MainInfoHotelCell* cellMainInfo = [tableView dequeueReusableCellWithIdentifier:@"CellMainInfo" forIndexPath:indexPath];
            cellMainInfo.hotel = self.hotel;
            cellMainInfo.detailName.text = self.hotel.lastName;
            [cellMainInfo.detailName sizeToFit];
            [cellMainInfo updateRating:self.hotel.starsNumber.floatValue];
            return cellMainInfo;
        }
            break;
        case 2:
        {
            DescriptionHotelCell* cellDescriptionHotel = [tableView dequeueReusableCellWithIdentifier:@"CellDescriptionHotel" forIndexPath:indexPath];
            cellDescriptionHotel.descriotionLabel.text = self.hotel.descriptionHotel;
            [cellDescriptionHotel.descriotionLabel sizeToFit];
            return cellDescriptionHotel;
        }
        default:
            return nil;
            break;
    }
}

@end
