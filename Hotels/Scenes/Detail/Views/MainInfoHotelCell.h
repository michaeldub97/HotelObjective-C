//
//  MainInfoHotelCell.h
//  Hotel
//
//  Created by Михаил on 14.01.2022.
//

#import <UIKit/UIKit.h>
#import "ContactInfoItemView.h"
#import "Hotel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainInfoHotelCell : UITableViewCell

@property (strong, nonatomic) UILabel* detailName;
@property (strong, nonatomic) UIView* starView;
@property (strong, nonatomic) ContactInfoItemView* addressView;
@property (strong, nonatomic) ContactInfoItemView* phoneView;

@property (strong, nonatomic) Hotel* hotel;

- (void)updateRating:(CGFloat)value;

@end

NS_ASSUME_NONNULL_END
