//
//  ViewController.m
//  Hotel
//
//  Created by Михаил on 10.12.2021.
//

#import "HotelListViewController.h"
#import "ServerManager.h"
#import "Hotel.h"
#import "HotelCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailHotelController.h"
#import "SettingsViewController.h"
#import "DataBaseManager.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface HotelListViewController ()  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray* hotels;

@end

@implementation HotelListViewController

- (void) loadView {
    
    [super loadView];
    
    CGRect frame = self.view.bounds;
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    [tableView registerClass:[HotelCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    self.tableView.allowsSelectionDuringEditing = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self connected]) {
        [[ServerManager sharedManager] getHotelListOnSuccess:^(NSArray * _Nonnull hotels) {
            NSLog(@"error = %@", hotels);
            self.hotels = [[NSMutableArray alloc] initWithArray: hotels];
            [[DataBaseManager sharedManager] saveAllHotels:hotels];
  //
            
            [self.tableView reloadData];
        } onFailure:^(NSError * _Nonnull error) {
            NSLog(@"error = %@", [error localizedDescription]);
        }];
    } else {
        NSArray* data = [[DataBaseManager sharedManager] getAllHotels];
        self.hotels = [[NSMutableArray alloc] initWithArray:data];
        [self.tableView reloadData];
    }
    self.title = @"Hotels";
    

    UIBarButtonItem* settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Настройки"
                                                                       style:UIBarButtonItemStylePlain target:self action:@selector(actionSettingsButton:)];
    self.navigationItem.rightBarButtonItem = settingsButton;
}

- (BOOL) connected {
    BOOL connected;
    BOOL isConnected;
    const char *host = "www.apple.com";
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
    SCNetworkReachabilityFlags flags;
    connected = SCNetworkReachabilityGetFlags(reachability, &flags);
    isConnected = NO;
    isConnected = connected && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
    CFRelease(reachability);
    return isConnected;
}

#pragma mark - Action

- (void)actionSettingsButton:(UIBarButtonItem*) sender{
    SettingsViewController* setting = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];

}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Hotel* hotel = [self.hotels objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = hotel.lastName;
    [cell.nameLabel sizeToFit];
    
    cell.addressLabel.text = hotel.hotelAddress;
    [cell.addressLabel sizeToFit];
    
    [cell updateRating:hotel.starsNumber.floatValue];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:hotel.imageURL];
    
    __weak HotelCell* weakCell = cell;
    
    cell.images.image = nil;
    
    [cell.images
     setImageWithURLRequest:request
     placeholderImage:nil
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        weakCell.images.image = image;
    }
     failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    }];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailHotelController* vc = [[DetailHotelController alloc] init];
    Hotel* hotel = [self.hotels objectAtIndex:indexPath.row];
    NSString* name = hotel.lastName;
    vc.title = name;
    vc.hotel = hotel;
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
