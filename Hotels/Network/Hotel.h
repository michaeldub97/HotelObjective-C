//
//  Hotel.h
//  Hotel
//
//  Created by Михаил on 17.12.2021.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Hotel : NSObject

@property (strong, nonatomic) NSString* descriptionHotel;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* hotelAddress;
@property (strong, nonatomic) NSURL* imageURL;
@property (strong, nonatomic) NSNumber* starsNumber;
@property (strong, nonatomic) NSString* phoneNumber;
@property (strong, nonatomic) NSArray* images;

- (id) initWithServerResponse:(NSDictionary*) responseObject;


@end

NS_ASSUME_NONNULL_END

