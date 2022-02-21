//
//  ScrolTablePhotoHotel.m
//  Hotel
//
//  Created by Михаил on 14.01.2022.
//

#import "ScrollTablePhotoHotel.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "TYCyclePagerViewCell.h"
#import "UIImageView+AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SDImageCache.h"


@interface ScrollTablePhotoHotel () <TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>

@property (strong, nonatomic) TYCyclePagerView* bannerBlockView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ScrollTablePhotoHotel

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addPagerView];
        [self addPageControl];
    }
    return self;
}

- (void)addPagerView {
    TYCyclePagerView *bannerBlockView = [[TYCyclePagerView alloc]init];
    bannerBlockView.isInfiniteLoop = YES;
    bannerBlockView.autoScrollInterval = 3.0;
    bannerBlockView.dataSource = self;
    bannerBlockView.delegate = self;
    [bannerBlockView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.contentView addSubview:bannerBlockView];
    _bannerBlockView = bannerBlockView;
    
    [self.bannerBlockView setTranslatesAutoresizingMaskIntoConstraints:false];
    [self setupBannerBlockViewConstraint];
}

//    NSLayoutConstraint *constraint;
//
//    if (isIpad) {
//        constraint = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:150.0];
//
//        NSLayoutConstraint *constraintIpad = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
//        [self.contentView addConstraints:@[constraintIpad]];
//
//    } else {
//        constraint = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
//    }
//
    
- (void)setupBannerBlockViewConstraint{
    
    BOOL isIpad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
        
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bottomBannerBlockView = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* rightBannerBlockView = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint* heightBannerBlockView = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.bannerBlockView attribute:NSLayoutAttributeHeight multiplier:0.0 constant: isIpad ? 400 : 200];
    
    NSLayoutConstraint *leftBannerBlockView = [NSLayoutConstraint constraintWithItem:self.bannerBlockView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    
    [self.contentView addConstraints:@[topConstraint, bottomBannerBlockView, rightBannerBlockView, heightBannerBlockView, leftBannerBlockView]];
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
    pageControl.pageIndicatorSize = CGSizeMake(12, 6);
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [_bannerBlockView addSubview:pageControl];
    _pageControl = pageControl;
    [self.pageControl setTranslatesAutoresizingMaskIntoConstraints:false];
    [self setupPageControlConstraint];
}

- (void)setupPageControlConstraint {
    
    NSLayoutConstraint* leftPageControl = [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
    
    NSLayoutConstraint* rightPageControl = [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15];
    
    NSLayoutConstraint* bottomPageControl = [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15];
    
    NSLayoutConstraint* heightPageControl = [NSLayoutConstraint constraintWithItem:self.pageControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.pageControl attribute:NSLayoutAttributeHeight multiplier:0.0 constant:15];

    [self.contentView addConstraints:@[leftPageControl, rightPageControl, bottomPageControl, heightPageControl]];
    
}

- (void)loadData: (NSArray *)data{
    _datas = [data copy];
    _pageControl.numberOfPages = _datas.count;
    [_bannerBlockView reloadData];
    
}

#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    NSURL* url = _datas[index];
    __weak TYCyclePagerViewCell* weakCell = cell;
    
    cell.collectionImage.image = nil;
        
    [cell.collectionImage sd_setImageWithURL:url
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                weakCell.collectionImage.image = image;
                                [[SDImageCache sharedImageCache] storeImage:image forKey:NSURLContentAccessDateKey toDisk:YES completion:^{
                                    NSLog(@"INFO: Image cached successfully!");
                                }];
                                 }];
    
    return cell;
}



- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(pageView.frame.size.width, CGRectGetHeight(pageView.frame));
    layout.itemHorizontalCenter = YES;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
