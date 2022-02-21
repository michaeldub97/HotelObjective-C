//
//  ModelHotel.h
//  Hotel
//
//  Created by Михаил on 21.01.2022.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModelHotel : NSManagedObject

@property (nonatomic, retain) NSString* lastName;
@property (nonatomic, retain) NSString* hotelAddress;
@property (nonatomic, retain) NSString* descriptionHotel;
@property (nonatomic, retain) NSString* phoneNumber;
@property (nonatomic, retain) NSArray* images;
@property (nonatomic, retain) NSString* imageURL;
@property (nonatomic, retain) NSNumber* starsNumber;

@end

NS_ASSUME_NONNULL_END
