// ViewController.h

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DeviceSelectTableViewController.h"
#import "bleGenericService.h"
#import "siOleAlertView.h"
#import "MiniDrone.h"

@interface ViewController : UIViewController <
    bluetoothHandlerDelegate,
    deviceSelectTableViewControllerDelegate,
    CLLocationManagerDelegate,
    MiniDroneDelegate>

@property NSString *EmpName;
@property DeviceSelectTableViewController *deviceSelector;

@property CLLocationManager *locationManager;
@property CLLocation *lastLocation;
@property NSMutableDictionary *rangedRegions;
@property NSTimer *locationTimer;
@property int lastBeaconId;
@property NSString *currentLocation;

@property (nonatomic, strong) ARService *service;
@property (nonatomic, strong) MiniDrone *miniDrone;
@property (nonatomic) dispatch_semaphore_t stateSem;

@property NSMutableArray *services;
@property NSMutableArray *displayTiles;
@property bluetoothHandler *handler;
@property CAGradientLayer *gradient;
@property siOleAlertView *aV;

@property (weak, nonatomic) IBOutlet UIImageView *logoContainer;
@property (weak, nonatomic) IBOutlet UIView *appCreditsContainer;
@property (weak, nonatomic) IBOutlet UIButton *selectSensorTagButton;
@property (weak, nonatomic) IBOutlet UIButton *connectDroneButton;
@property (weak, nonatomic) IBOutlet UIButton *takeOffButton;
@property (weak, nonatomic) IBOutlet UILabel *batteryLabel;
@property (weak, nonatomic) IBOutlet UILabel *flyStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *flightPathLabel;
//@property (weak, nonatomic) IBOutlet UILabel *beaconLabel;

+ (ViewController*)sharedView;

- (IBAction)selectSensorTagButtonTouched:(id)sender;
- (IBAction)connectDroneButtonTouched:(id)sender;
- (IBAction)takeOffButtonTouched:(id)sender;

@end
