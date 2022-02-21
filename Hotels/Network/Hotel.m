//
//  Hotel.m
//  Hotel
//
//  Created by Михаил on 17.12.2021.
//

#import "Hotel.h"

@implementation Hotel

- (id) initWithServerResponse:(NSDictionary*) responseObject
{
    self = [super init];
    if (self) {
        self.lastName = [responseObject objectForKey:@"name"];
        self.hotelAddress = [responseObject objectForKey:@"address"];
        NSArray* images = [responseObject objectForKey:@"images"];
        self.starsNumber = [responseObject objectForKey:@"stars"];
        self.phoneNumber = [responseObject objectForKey:@"phone"];
        self.imageURL = [self createUrlFrom: images.firstObject];
        NSMutableArray* mutableArray = [[NSMutableArray alloc] init];
        self.descriptionHotel = [responseObject objectForKey:@"description"];
        
        for (NSString* image in images){
            NSURL* url = [self createUrlFrom:image];
            [mutableArray addObject:url];
        }
        self.images = [NSMutableArray arrayWithArray:mutableArray];
    }
    return self;
}


- (NSURL* )createUrlFrom:(NSString* ) imageName {
    NSString* urlString = [NSString stringWithFormat:@"https://raw.githubusercontent.com/Sinweaver/HotelsJson/master/%@", imageName];
    return  [NSURL URLWithString:urlString];
}

@end
