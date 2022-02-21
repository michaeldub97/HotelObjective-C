//
//  HotelCell.h
//  Hotel
//
//  Created by Михаил on 20.12.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotelCell : UITableViewCell

@property (strong, nonatomic) UIImageView* images;
@property (strong, nonatomic) UILabel* nameLabel;
@property (strong, nonatomic) UILabel* addressLabel;

- (void)updateRating:(CGFloat)value;

@end

NS_ASSUME_NONNULL_END
