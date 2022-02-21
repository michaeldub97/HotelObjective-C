//
//  DetailHotelController.h
//  Hotel
//
//  Created by Михаил on 22.12.2021.
//

#import <UIKit/UIKit.h>
#import "Hotel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailHotelController : UIViewController

@property (strong, nonatomic) Hotel* hotel;
@property (strong, nonatomic) UITableView* detailInfoTableView;



@end

NS_ASSUME_NONNULL_END
