//
//  TYCyclePagerViewCellCollectionViewCell.m
//  Hotel
//
//  Created by Михаил on 15.01.2022.
//

#import "TYCyclePagerViewCell.h"

@interface TYCyclePagerViewCell ()

@end

@implementation TYCyclePagerViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addImage];
    }
    return self;
}

- (void) addImage{
    self.collectionImage = [[UIImageView alloc] init];
    self.collectionImage.contentMode = UIViewContentModeScaleAspectFit | UIViewContentModeScaleAspectFill;
    [self.collectionImage setTranslatesAutoresizingMaskIntoConstraints:false];
    self.collectionImage.clipsToBounds = true;
    [self.contentView addSubview:self.collectionImage];
    
    [self setupCollectionImageConstraints];
}

- (void)setupCollectionImageConstraints {
    NSLayoutConstraint *leftImageCollectionImage = [NSLayoutConstraint constraintWithItem:self.collectionImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *rightImageCollectionImage = [NSLayoutConstraint constraintWithItem:self.collectionImage attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *topImageCollectionImage = [NSLayoutConstraint constraintWithItem:self.collectionImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bottomImageCollectionImage = [NSLayoutConstraint constraintWithItem:self.collectionImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    [self.contentView addConstraints:@[leftImageCollectionImage, rightImageCollectionImage, topImageCollectionImage, bottomImageCollectionImage]];
}

@end
