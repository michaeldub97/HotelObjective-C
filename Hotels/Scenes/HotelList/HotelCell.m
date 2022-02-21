//
//  HotelCell.m
//  Hotel
//
//  Created by Михаил on 20.12.2021.
//

#import "HotelCell.h"
#import <HCSStarRatingView/HCSStarRatingView.h>

@interface HotelCell()

@property (strong, nonatomic) HCSStarRatingView* starValue;

@end

@implementation HotelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.images = [[UIImageView alloc] init];
        self.images.contentMode = UIViewContentModeScaleAspectFit | UIViewContentModeScaleAspectFill ;
        [self.images setTranslatesAutoresizingMaskIntoConstraints:false];
        self.images.clipsToBounds = true;
        [self.contentView addSubview:self.images];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:false];
        self.nameLabel.numberOfLines = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.nameLabel];
        
        
        self.addressLabel = [[UILabel alloc] init];
        self.addressLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.addressLabel setTranslatesAutoresizingMaskIntoConstraints:false];
        self.addressLabel.numberOfLines = 1;
        self.addressLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.addressLabel];
        
        
        HCSStarRatingView *starRatingView = [HCSStarRatingView new];
        starRatingView.frame = CGRectMake(110, 40, 100, 15);
        starRatingView.maximumValue = 5;
        starRatingView.minimumValue = 0;
        starRatingView.tintColor = [UIColor blackColor];
        self.starValue = starRatingView;
        [self.contentView addSubview:self.starValue];
        
        
        [self setupImageConstraints];
        [self setupNameLabelConstraints];
        [self setupAddressLabelConstraints];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
    
}

- (void)setupImageConstraints {
    NSLayoutConstraint *leftImage = [NSLayoutConstraint constraintWithItem:self.images attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];

    NSLayoutConstraint *topImage = [NSLayoutConstraint constraintWithItem:self.images attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bottomImage = [NSLayoutConstraint constraintWithItem:self.images attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *widthImage = [NSLayoutConstraint constraintWithItem:self.images attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.images attribute:NSLayoutAttributeWidth multiplier:0.0 constant:100];
    
    [self.contentView addConstraints:@[leftImage, topImage, bottomImage, widthImage]];
}

- (void)setupNameLabelConstraints {
    NSLayoutConstraint *topNameLabel = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* rightNameLabel = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* heightNameLabel = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.nameLabel attribute:NSLayoutAttributeHeight multiplier:0.0 constant:40];
    
    NSLayoutConstraint *horizontallyNameLabel = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.images attribute:NSLayoutAttributeRight multiplier:1.0 constant:10];
    
    [self.contentView addConstraints:@[topNameLabel, rightNameLabel , heightNameLabel, horizontallyNameLabel]];
}

- (void)setupAddressLabelConstraints{
    NSLayoutConstraint *bottomAddressLabel = [NSLayoutConstraint constraintWithItem:self.addressLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15];
    
    NSLayoutConstraint* rightAddressLabel = [NSLayoutConstraint constraintWithItem:self.addressLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* heightAddressLabel = [NSLayoutConstraint constraintWithItem:self.addressLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.addressLabel attribute:NSLayoutAttributeHeight multiplier:0.0 constant:14];
    
    NSLayoutConstraint *horizontallyAddressLabel = [NSLayoutConstraint constraintWithItem:self.addressLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.images attribute:NSLayoutAttributeRight multiplier:1.0 constant:10];
    
    [self.contentView addConstraints:@[bottomAddressLabel, rightAddressLabel, heightAddressLabel, horizontallyAddressLabel]];
}


- (void) updateRating:(CGFloat)value {
    self.starValue.value = value;
}

@end
