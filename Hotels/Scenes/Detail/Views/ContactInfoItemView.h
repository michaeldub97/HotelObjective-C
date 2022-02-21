//
//  ContactInfoItemView.h
//  Hotel
//
//  Created by Михаил on 18.01.2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactInfoItemView : UIView

@property (strong, nonatomic) UIImageView* logoAddress;
@property (strong, nonatomic) UILabel* detailAddress;

@property (strong, nonatomic) UIImageView* logoPhone;
@property (strong, nonatomic) UILabel* detailPhone;

@end

NS_ASSUME_NONNULL_END
