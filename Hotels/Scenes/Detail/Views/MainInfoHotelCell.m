//
//  MainInfoHotelCell.m
//  Hotel
//
//  Created by Михаил on 14.01.2022.
//

#import "MainInfoHotelCell.h"
#import <HCSStarRatingView/HCSStarRatingView.h>


@interface MainInfoHotelCell()

@property (strong, nonatomic) HCSStarRatingView* starValue;

@end

@implementation MainInfoHotelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        BOOL isIpad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
        self.detailName = [[UILabel alloc]init];
        [self.detailName setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.detailName.font = [UIFont systemFontOfSize:isIpad ? 26 : 17];
        self.detailName.numberOfLines = 0;
        [self.contentView addSubview:self.detailName];
        
        self.starView = [[UIView alloc] init];
        [self.starView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.starView];
        
        self.addressView = [[ContactInfoItemView alloc] init];
        self.addressView.logoAddress.image = [UIImage imageNamed:@"address.png"];
        [self.addressView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.addressView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.phoneView = [[ContactInfoItemView alloc] init];
        self.phoneView.logoPhone.image = [UIImage imageNamed:@"phone.png"];
        [self.phoneView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.phoneView];
        
        HCSStarRatingView *starRatingView = [HCSStarRatingView new];
        starRatingView.frame = CGRectMake(0, 0, 100, 15);
        starRatingView.maximumValue = 5;
        starRatingView.minimumValue = 0;
        starRatingView.tintColor = [UIColor blackColor];
        self.starValue = starRatingView;
        [self.starView addSubview:self.starValue];
        
        [self setupDetailNameConstraints];
        [self setupStarViewConstraints];
        [self setupAddressViewConstraints];
        [self setupPhoneViewConstraints];

    }
    return self;
}

- (void)setHotel:(Hotel *)hotel {
    _hotel = hotel;
    self.addressView.detailAddress.text = hotel.hotelAddress;
    self.phoneView.detailPhone.text = hotel.phoneNumber;
    
}

- (void)updateRating:(CGFloat)value {
    self.starValue.value = value;
}

- (void)setupDetailNameConstraints{
    
    NSLayoutConstraint* leftDetailName = [NSLayoutConstraint constraintWithItem:self.detailName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    
    NSLayoutConstraint* rigthDetailName = [NSLayoutConstraint constraintWithItem:self.detailName attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    NSLayoutConstraint* topDetailName = [NSLayoutConstraint constraintWithItem:self.detailName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    [self.contentView addConstraints:@[leftDetailName, rigthDetailName, topDetailName]];
    
}

- (void)setupStarViewConstraints{
    
    NSLayoutConstraint* leftStarView = [NSLayoutConstraint constraintWithItem:self.starView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    
    NSLayoutConstraint* rightStarView = [NSLayoutConstraint constraintWithItem:self.starView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    NSLayoutConstraint* topStarView = [NSLayoutConstraint constraintWithItem:self.starView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.detailName attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5];
    
    NSLayoutConstraint* heightStarView = [NSLayoutConstraint constraintWithItem:self.starView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.starView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:15];
    

    
    [self.contentView addConstraints:@[leftStarView, rightStarView, topStarView, heightStarView]];
}

- (void)setupAddressViewConstraints{
    
    NSLayoutConstraint* leftAddressView = [NSLayoutConstraint constraintWithItem:self.addressView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    
    NSLayoutConstraint* rightAddressView = [NSLayoutConstraint constraintWithItem:self.addressView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    NSLayoutConstraint* topAddressView = [NSLayoutConstraint constraintWithItem:self.addressView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.starView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:7];
    
    NSLayoutConstraint* heightAddressView = [NSLayoutConstraint constraintWithItem:self.addressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.addressView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:24];
    
    [self.contentView addConstraints:@[leftAddressView, rightAddressView, topAddressView, heightAddressView]];
}

- (void)setupPhoneViewConstraints{
    
    NSLayoutConstraint* leftPhoneView = [NSLayoutConstraint constraintWithItem:self.phoneView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    
    NSLayoutConstraint* rightPhoneView = [NSLayoutConstraint constraintWithItem:self.phoneView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    NSLayoutConstraint* topPhoneView = [NSLayoutConstraint constraintWithItem:self.phoneView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.addressView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:7];
    
    NSLayoutConstraint* bottomPhoneView = [NSLayoutConstraint constraintWithItem:self.phoneView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5];
    
    NSLayoutConstraint* heightPhoneView = [NSLayoutConstraint constraintWithItem:self.phoneView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.phoneView attribute:NSLayoutAttributeHeight multiplier:0.0 constant:24];
    
    [self.contentView addConstraints:@[leftPhoneView, rightPhoneView, topPhoneView, bottomPhoneView, heightPhoneView]];
}

@end
