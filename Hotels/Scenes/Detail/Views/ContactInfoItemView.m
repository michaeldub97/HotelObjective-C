//
//  ContactInfoItemView.m
//  Hotel
//
//  Created by Михаил on 18.01.2022.
//

#import "ContactInfoItemView.h"

@implementation ContactInfoItemView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        BOOL isIpad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
        
        self.logoAddress = [[UIImageView alloc] init];
        self.logoAddress.contentMode = UIViewContentModeScaleAspectFit | UIViewContentModeScaleAspectFill ;
        [self.logoAddress setTranslatesAutoresizingMaskIntoConstraints:false];
        self.logoAddress.clipsToBounds = true;
        [self addSubview:self.logoAddress];
        
        self.detailAddress = [[UILabel alloc]init];
        [self.detailAddress setTranslatesAutoresizingMaskIntoConstraints:false];
        self.detailAddress.font = [UIFont systemFontOfSize:isIpad ? 20 : 14];
        self.detailAddress.numberOfLines = 0;
        [self addSubview:self.detailAddress];
        
        self.logoPhone = [[UIImageView alloc] init];
        self.logoPhone.contentMode = UIViewContentModeScaleAspectFit | UIViewContentModeScaleAspectFill;
        [self.logoPhone setTranslatesAutoresizingMaskIntoConstraints:false];
        self.logoPhone.clipsToBounds = true;
        [self addSubview:self.logoPhone];
        
        self.detailPhone = [[UILabel alloc]init];
        [self.detailPhone setTranslatesAutoresizingMaskIntoConstraints:false];
        self.detailPhone.font = [UIFont systemFontOfSize:isIpad ? 20 : 13];
        [self addSubview:self.detailPhone];
        
        [self setupLogoAddressConstraints];
        [self setupDetailAddressConstraints];
        [self setupLogoPhoneConstraints];
        [self setupDetailPhoneConstraints];
    }
    return self;
}

- (void)setupLogoAddressConstraints{
    
    NSLayoutConstraint* leftLogoAddress = [NSLayoutConstraint constraintWithItem:self.logoAddress attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* topLogoAddress = [NSLayoutConstraint constraintWithItem:self.logoAddress attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* bottomLogoAddress = [NSLayoutConstraint constraintWithItem:self.logoAddress attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* wigthLogoAddress = [NSLayoutConstraint constraintWithItem:self.logoAddress attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.logoAddress attribute:NSLayoutAttributeWidth multiplier:0.0 constant:24];
    
    [self addConstraints:@[leftLogoAddress, topLogoAddress, bottomLogoAddress, wigthLogoAddress]];
    
}

- (void)setupDetailAddressConstraints{
   
    NSLayoutConstraint* leftDetailAddress = [NSLayoutConstraint constraintWithItem:self.detailAddress attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.logoAddress attribute:NSLayoutAttributeRight multiplier:1.0 constant:5];
    
    NSLayoutConstraint* rightDetailAddress = [NSLayoutConstraint constraintWithItem:self.detailAddress attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* topDetailAddress = [NSLayoutConstraint constraintWithItem:self.detailAddress attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
//    NSLayoutConstraint* bottomDetailAddress = [NSLayoutConstraint constraintWithItem:self.detailAddress attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    [self addConstraints:@[leftDetailAddress, rightDetailAddress, topDetailAddress]];
}

- (void)setupLogoPhoneConstraints{
    
    NSLayoutConstraint* leftLogoPhone = [NSLayoutConstraint constraintWithItem:self.logoPhone attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* topLogoPhone = [NSLayoutConstraint constraintWithItem:self.logoPhone attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* bottomLogoPhone = [NSLayoutConstraint constraintWithItem:self.logoPhone attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* wigthLogoPhone = [NSLayoutConstraint constraintWithItem:self.logoPhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.logoPhone attribute:NSLayoutAttributeWidth multiplier:0.0 constant:24];
    
    [self addConstraints:@[leftLogoPhone, topLogoPhone, bottomLogoPhone, wigthLogoPhone]];
    
}

- (void)setupDetailPhoneConstraints{
   
    NSLayoutConstraint* leftDetailPhone = [NSLayoutConstraint constraintWithItem:self.detailPhone attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.logoPhone attribute:NSLayoutAttributeRight multiplier:1.0 constant:5];
    
    NSLayoutConstraint* rightDetailPhone = [NSLayoutConstraint constraintWithItem:self.detailPhone attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* topDetailPhone = [NSLayoutConstraint constraintWithItem:self.detailPhone attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* bottomDetailPhone = [NSLayoutConstraint constraintWithItem:self.detailPhone attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    [self addConstraints:@[leftDetailPhone, rightDetailPhone, topDetailPhone, bottomDetailPhone]];
}

@end
