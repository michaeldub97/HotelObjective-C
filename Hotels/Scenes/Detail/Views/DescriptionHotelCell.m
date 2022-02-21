//
//  DescriptionHotelCell.m
//  Hotel
//
//  Created by Михаил on 14.01.2022.
//

#import "DescriptionHotelCell.h"

@implementation DescriptionHotelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.descriotionLabel = [[UILabel alloc] init];
        [self.descriotionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.descriotionLabel.font = [UIFont systemFontOfSize:12.0];
        self.descriotionLabel.numberOfLines = 0;
        [self.contentView addSubview:self.descriotionLabel];
        [self setupDescriotionLabelConstraints];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupDescriotionLabelConstraints{
    NSLayoutConstraint* leftDescriotionLabel= [NSLayoutConstraint constraintWithItem:self.descriotionLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    
    NSLayoutConstraint* rightDescriotionLabel = [NSLayoutConstraint constraintWithItem:self.descriotionLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    NSLayoutConstraint* topDescriotionLabel = [NSLayoutConstraint constraintWithItem:self.descriotionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:5];
    
    NSLayoutConstraint* bottomDescriotionLabel = [NSLayoutConstraint constraintWithItem:self.descriotionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5];
    
    [self.contentView addConstraints:@[leftDescriotionLabel, rightDescriotionLabel, topDescriotionLabel, bottomDescriotionLabel]];
}

@end
