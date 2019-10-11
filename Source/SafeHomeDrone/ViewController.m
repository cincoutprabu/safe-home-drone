// ViewController.m

#import "ViewController.h"
#import "siOleAlertView.h"

#import "sensorTagAmbientTemperatureService.h"
#import "sensorTagAirPressureService.h"
#import "sensorTagHumidityService.h"
#import "sensorTagMovementService.h"
#import "sensorTagLightService.h"
#import "sensorTagKeyService.h"
#import "deviceInformationService.h"

@interface ViewController ()
@end

@implementation ViewController

+ (ViewController*)sharedView
{
    static ViewController *mainView = nil;
    
    if (!mainView)
    {
        mainView = [[ViewController alloc] initWithNibName:@"MainView" bundle:nil];
    }
    
    return mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.handler = [bluetoothHandler sharedInstance];
    self.handler.delegate = self;
    self.gradient = [CAGradientLayer layer];
    self.gradient.frame = self.view.bounds;
    self.gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f] CGColor], (id)[[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f] CGColor], nil];
    [self.view.layer insertSublayer:self.gradient atIndex:0];
    self.displayTiles = [[NSMutableArray alloc] init];
    
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void) viewWillLayoutSubviews {
    self.gradient.frame = self.view.bounds;
    for (displayTile *t in self.displayTiles) {
        [t setFrame:self.view.frame];
        t.title.text = t.title.text;
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    self.selectSensorTagButton.layer.cornerRadius = 12.0f;
    self.connectDroneButton.layer.cornerRadius = 12.0f;
    self.takeOffButton.layer.cornerRadius = 12.0f;
    self.currentLocation = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) deviceReady:(BOOL)ready peripheral:(CBPeripheral *)peripheral {
    if (ready) {
        if (self.aV.superview) {
            [self.aV dismissMessage];
        }
        
        for (int ii = 0; ii < self.displayTiles.count; ii++) {
            displayTile *t = [self.displayTiles objectAtIndex:ii];
            [t removeFromSuperview];
        }
        
        self.services = [[NSMutableArray alloc] init];
        for (CBService *s in peripheral.services) {
            if ([sensorTagAmbientTemperatureService isCorrectService:s]) {
                sensorTagAmbientTemperatureService *serv = [[sensorTagAmbientTemperatureService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            if ([sensorTagHumidityService isCorrectService:s]) {
                sensorTagHumidityService *serv = [[sensorTagHumidityService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            if ([sensorTagAirPressureService isCorrectService:s]) {
                sensorTagAirPressureService *serv = [[sensorTagAirPressureService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            if ([sensorTagLightService isCorrectService:s]) {
                sensorTagLightService *serv = [[sensorTagLightService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            if ([sensorTagKeyService isCorrectService:s]) {
                sensorTagKeyService *serv = [[sensorTagKeyService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            /*
            if ([sensorTagMovementService isCorrectService:s]) {
                sensorTagMovementService *serv = [[sensorTagMovementService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            if ([deviceInformationService isCorrectService:s]) {
                deviceInformationService *serv = [[deviceInformationService alloc] initWithService:s];
                [self.services addObject:serv];
                [serv configureService];
                displayTile *t = [serv getViewForPresentation];
                [t setFrame:self.view.frame];
                t.title.text = t.title.text;
                [self.displayTiles addObject:t];
                [self.view addSubview:t];
            }
            */
        }
    }
    else {
        if (self.aV) [self.aV dismissMessage];
        self.aV = [[siOleAlertView alloc] initInView:self.view];
        [self.aV blinkMessage:@"Disconnected!"];
    }
}

- (void) didReadCharacteristic:(CBCharacteristic *)characteristic {
    for (int ii = 0; ii < self.services.count; ii++) {
        bleGenericService *s = [self.services objectAtIndex:ii];
        [s dataUpdate:characteristic];
    }
}

- (void) didGetNotificaitonOnCharacteristic:(CBCharacteristic *)characteristic {
    for (int ii = 0; ii < self.services.count; ii++) {
        bleGenericService *s = [self.services objectAtIndex:ii];
        [s dataUpdate:characteristic];
    }
}

- (void)didWriteCharacteristic:(CBCharacteristic *)characteristic error:(NSError *) error {
    for (int ii = 0; ii < self.services.count; ii++) {
        bleGenericService *s = [self.services objectAtIndex:ii];
        [s wroteValue:characteristic error:error];
    }
}

- (IBAction)selectSensorTagButtonTouched:(id)sender {
    [self.aV dismissMessage];
    [self.handler disconnectCurrentDevice];
    if (!self.deviceSelector) {
        self.deviceSelector = [[DeviceSelectTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        self.deviceSelector.devSelectDelegate = self;
    }
    self.logoContainer.hidden = YES;
    [self showViewController:self.deviceSelector sender:nil];
}

- (IBAction)connectDroneButtonTouched:(id)sender
{
    NSString* buttonText = ((UIButton*)sender).currentTitle;
    if ([buttonText isEqualToString:@"Connect Drone"])
    {
        [self registerReceivers];
        [self startDiscovery];
    }
    else if ([buttonText isEqualToString:@"Disconnect"])
    {
        [self disconnectDrone];
    }
}

- (IBAction)takeOffButtonTouched:(id)sender
{
    switch ([_miniDrone flyingState])
    {
        case ARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_LANDED:
            //[_miniDrone takeOff];
            hoverCount = 0;
            part2Triggered = NO;
            [self setupDroneSquarePatternPart1];
            break;
        case ARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_FLYING:
        case ARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_HOVERING:
            _stopDrone = YES;
            [_miniDrone land];
            break;
        default:
            break;
    }
}

bool _stopDrone = NO;

- (void)setupDroneSquarePatternPart1
{
    // Build flight path as 'blocks'
    
    void (^ takeOffBlock)(void) = ^{
        [self setFlyStatus:@"RightSide - TakeOff"];
        [self->_miniDrone takeOff];
    };

    // RIGHT SIDE of the SQUARE
    void (^ rightFlyForward)(void) = ^{
        [self setFlyStatus:@"RightSide - FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:1];         // FLy forward
            [self->_miniDrone setPitch:50];
        }
    };
    
    void (^ rightStopFlyForward)(void) = ^{
        [self setFlyStatus:@"RightSide - Stop FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:0];         // Stop flying forward
            [self->_miniDrone setPitch:0];
        }
    };
    
    void (^ rightTurnLeft)(void) = ^{
        [self setFlyStatus:@"RightSide - TurnLeft"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setYaw:-50];        // Turn left
        }
    };
    
    void (^ rightStopTurnLeft)(void) = ^{
        [self setFlyStatus:@"RightSide - Stop TurnLeft"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setYaw:0];          // Stop turning left
        }
    };
    
    void (^ frontFlyForward)(void) = ^{
        [self setFlyStatus:@"FrontSide - FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:1];         // Fly forward
            [self->_miniDrone setPitch:50];
        }
    };
    
    void (^ frontStopFlyForward)(void) = ^{
        [self setFlyStatus:@"FrontSide - Stop FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:0];         // Stop flying forward
            [self->_miniDrone setPitch:0];
        }
    };
    
    // Setup flight path and dispatch
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t queue = dispatch_get_main_queue();
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // Take-off
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), queue, takeOffBlock);
    
    // RIGHT SIDE of the SQUARE
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), queue, rightFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), queue, rightStopFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), queue, rightTurnLeft);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(11 * NSEC_PER_SEC)), queue, rightStopTurnLeft);
    
    // FRONT SIDE of the SQUARE
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(13 * NSEC_PER_SEC)), queue, frontFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), queue, frontStopFlyForward);
}

- (void)setupDroneSquarePatternPart2
{
    // Build flight path as 'blocks'
    
    void (^ frontTurnLeft)(void) = ^{
        [self setFlyStatus:@"FrontSide - TurnLeft"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setYaw:-50];        // Turn left
        }
    };
    
    void (^ frontStopTurnLeft)(void) = ^{
        [self setFlyStatus:@"FrontSide - Stop TurnLeft"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setYaw:0];          // Stop turning left
        }
    };
    
    void (^ leftFlyForward)(void) = ^{
        [self setFlyStatus:@"LeftSide - FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:1];         // Fly forward
            [self->_miniDrone setPitch:50];
        }
    };
    
    void (^ leftStopFlyForward)(void) = ^{
        [self setFlyStatus:@"LeftSide - Stop FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:0];         // Stop flying forward
            [self->_miniDrone setPitch:0];
        }
    };
    
    void (^ leftTurnLeft)(void) = ^{
        [self setFlyStatus:@"LeftSide - TurnLeft"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setYaw:-50];        // Turn left
        }
    };
    
    void (^ leftStopTurnLeft)(void) = ^{
        [self setFlyStatus:@"LeftSide - Stop TurnLeft"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setYaw:0];          // Stop turning left
        }
    };
    
    void (^ bottomFlyForward)(void) = ^{
        [self setFlyStatus:@"BottomSide - FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:1];         // FLy forward
            [self->_miniDrone setPitch:50];
        }
    };
    
    void (^ bottomStopFlyForward)(void) = ^{
        [self setFlyStatus:@"BottomSide - Stop FlyForward"];
        
        if (_stopDrone) {
            [self->_miniDrone land];
        } else {
            [self->_miniDrone setFlag:0];         // Stop flying forward
            [self->_miniDrone setPitch:0];
        }
    };
    
    void (^ landBlock)(void) = ^{
        [self setFlyStatus:@"BottomSide - Land"];
        
        [self->_miniDrone land];
    };
    
    // Setup flight path and dispatch
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t queue = dispatch_get_main_queue();
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), queue, frontTurnLeft);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), queue, frontStopTurnLeft);
    
    // LEFT SIDE of the SQUARE
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.5 * NSEC_PER_SEC)), queue, leftFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7.5 * NSEC_PER_SEC)), queue, leftStopFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9.5 * NSEC_PER_SEC)), queue, leftTurnLeft);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12.5 * NSEC_PER_SEC)), queue, leftStopTurnLeft);
    
    // BOTTOM SIDE of the SQUARE
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(14.5 * NSEC_PER_SEC)), queue, bottomFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(16.5 * NSEC_PER_SEC)), queue, bottomStopFlyForward);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(18.5 * NSEC_PER_SEC)), queue, leftTurnLeft);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(21.5 * NSEC_PER_SEC)), queue, leftStopTurnLeft);

    // Land
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(23.5 * NSEC_PER_SEC)), queue, landBlock);
}

- (void)setFlyStatus:(NSString*)statusText
{
    _flightPathLabel.text = statusText;
    NSLog(@"%@", statusText);
}

- (void) newDeviceWasSelected:(NSUUID *)identifier {
    self.appCreditsContainer.hidden = YES;
    self.selectSensorTagButton.hidden = YES;
    
    self.handler.connectToIdentifier = identifier;
    self.handler.shouldReconnect = YES;
    
    for (int ii = 0; ii < self.displayTiles.count; ii++) {
        displayTile *t = [self.displayTiles objectAtIndex:ii];
        [t removeFromSuperview];
    }
    self.displayTiles = [[NSMutableArray alloc] init];
    self.services = [[NSMutableArray alloc] init];
}

- (void)beginTrackingBeacons
{
    NSString *uuidString = @"C8443AB7-9BCE-46DD-B890-975817E3ABFD";
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:uuidString];
    //CLBeaconMajorValue major = [@1 intValue];
    //CLBeaconMinorValue minor = [@(m) intValue];
    //NSString *beaconId = [self buildBeaconID:uuidString major:major minor:minor];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:uuidString];
    //CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:major minor:minor identifier:beaconId];
    if (region != nil)
    {
        [self.locationManager startRangingBeaconsInRegion:region];
        if (!self.rangedRegions) self.rangedRegions = [NSMutableDictionary new];
        self.rangedRegions[region] = [NSArray array];
        
        NSLog(@"Ranging started for %@", uuidString);
    }
    
    // Start location timer
    self.locationTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(locationTimer_Tick) userInfo:nil repeats:YES];
}

- (NSString*)buildBeaconID:(NSString*)uuid major:(int)major minor:(int)minor
{
    return [[NSString stringWithFormat:@"%@|%d|%d", uuid, major, minor] uppercaseString];
}

- (void)locationTimer_Tick
{
    NSArray *nearbyBeacons = [self getNearbyBeacons];
    if (nearbyBeacons.count == 0) return;
    
    CLBeacon *nearest = [nearbyBeacons firstObject];
    int nearestBeaconId = [nearest.minor intValue];
    
    //Check if nearest-beacon changed
    if (nearestBeaconId != self.lastBeaconId)
    {
        self.lastBeaconId = nearestBeaconId;
    }
}

- (NSArray*)getNearbyBeacons
{
    //Get all valid nearby beacons
    NSMutableArray *allBeacons = [NSMutableArray array];
    for (NSArray *beaconList in [self.rangedRegions allValues])
    {
        for (CLBeacon *beacon in beaconList)
        {
            if (beacon.proximity != CLProximityUnknown)
            {
                [allBeacons addObject:beacon];
            }
        }
    }
    
    if (allBeacons.count == 0)
    {
        NSLog(@"No beacons found nearby");
        return [NSArray array];
    }
    
    //Sort nearby beacons based on accuracy or rssi
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"accuracy" ascending:YES];
    NSArray *sortedBeacons = [allBeacons sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    CLBeacon *nearest = [sortedBeacons firstObject];
    NSLog(@"Nearest of %d beacons: %@. Proximity: %@, Accuracy: %.2lf, RSSI: %d", (int)allBeacons.count, nearest.minor, [self proximityToString:nearest.proximity], nearest.accuracy, (int)nearest.rssi);
    
    self.currentLocation = [self beaconToString:[nearest.minor intValue]];
    //self.beaconLabel.text = _currentLocation;
    
    return [NSArray arrayWithObject:nearest];
}

- (NSString*)beaconToString:(int)minor
{
    switch (minor)
    {
        case 1001: return @"North";
        case 1002: return @"PeachTree";
        case 1003: return @"Spring";
        case 1004: return @"NorthSide";
        default: return @"-";
    }
}

- (NSString*)proximityToString:(CLProximity)proximity
{
    switch (proximity)
    {
        case CLProximityUnknown: return @"None";
        case CLProximityImmediate: return @"Imm";
        case CLProximityNear: return @"Near";
        case CLProximityFar: return @"Far";
        default: return @"";
    }
}

- (NSString*)flyStateToString:(eARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE)flyState
{
    switch (flyState)
    {
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_LANDED: return @"Landed";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_TAKINGOFF: return @"TakingOff";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_HOVERING: return @"Hovering";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_FLYING: return @"Flying";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_LANDING: return @"Landing";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_EMERGENCY: return @"Emergency";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_ROLLING: return @"Rolling";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_INIT: return @"Init";
        case ARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_MAX: return @"Max";
        default: return @"";
    }
}

# pragma mark -- Location events

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    self.lastLocation = [locations lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    //NSLog(@"%d beacons found for region %@", (int)beacons.count, region.identifier);
    
    self.rangedRegions[region] = beacons;
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"Ranging failed for region %@. Error: %@", region.identifier, error);
}

/*
  Drone Events
*/

-(void)miniDrone:(MiniDrone *)miniDrone connectionDidChange:(eARCONTROLLER_DEVICE_STATE)state
{
    switch (state) {
        case ARCONTROLLER_DEVICE_STATE_RUNNING:
            break;
        case ARCONTROLLER_DEVICE_STATE_STOPPED:
            dispatch_semaphore_signal(_stateSem);
            break;
        default:
            break;
    }
}

- (void)miniDrone:(MiniDrone*)miniDrone batteryDidChange:(int)batteryPercentage
{
    //NSLog(@"Battery changed to: %d%%", batteryPercentage);
    
    self.batteryLabel.text = [NSString stringWithFormat:@"%d %%", batteryPercentage];
}

int hoverCount = 0;
bool part2Triggered = NO;

- (void)miniDrone:(MiniDrone*)miniDrone flyingStateDidChange:(eARCOMMANDS_MINIDRONE_PILOTINGSTATE_FLYINGSTATECHANGED_STATE)state
{
    NSString *flyStateText = [self flyStateToString:state];
    NSLog(@"FlyState: %@, HoverCount: %d", flyStateText, hoverCount);
    _flyStateLabel.text = flyStateText;
    
    if (hoverCount == 2 && part2Triggered == NO) {
        [self setupDroneSquarePatternPart2];
        part2Triggered = YES;
    }
    
    switch (state) {
        case ARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_LANDED:
            [_takeOffButton setTitle:@"Take Off" forState:UIControlStateNormal];
            //[takeOffButton setEnabled:YES];
            //[downloadMediasButton setEnabled:YES];
            break;
        case ARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_FLYING:
        case ARCOMMANDS_ARDRONE3_PILOTINGSTATE_FLYINGSTATECHANGED_STATE_HOVERING:
            hoverCount += 1;
            [_takeOffButton setTitle:@"Land" forState:UIControlStateNormal];
            //[takeOffButton setEnabled:YES];
            //[downloadMediasButtton setEnabled:NO];
            break;
        default:
            //[takeOffButton setEnabled:NO];
            //[downloadMediasButton setEnabled:NO];
            break;
    }
}

- (void)miniDrone:(MiniDrone*)miniDrone didFoundMatchingMedias:(NSUInteger)nbMedias
{
}

- (void)miniDrone:(MiniDrone*)miniDrone media:(NSString*)mediaName downloadDidProgress:(int)progress
{
}

- (void)miniDrone:(MiniDrone*)miniDrone mediaDownloadDidFinish:(NSString*)mediaName
{
}

- (BOOL)miniDrone:(MiniDrone *)miniDrone configureDecoder:(ARCONTROLLER_Stream_Codec_t)codec
{
    return YES;
}

- (BOOL)miniDrone:(MiniDrone *)miniDrone didReceiveFrame:(ARCONTROLLER_Frame_t *)frame
{
    return YES;
}

/*
  Helper Methods
*/

- (void)registerReceivers
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(discoveryDidUpdateServices:) name:kARDiscoveryNotificationServicesDevicesListUpdated object:nil];
}

- (void)startDiscovery
{
    [[ARDiscovery sharedInstance] start];
}

- (void)discoveryDidUpdateServices:(NSNotification *)notification
{
    NSArray *deviceList = [[notification userInfo] objectForKey:kARDiscoveryServicesList];
    
    for (ARService* service in deviceList)
    {
        NSLog(@"Drone Service: %@", service.name);
        
        if ([service.name rangeOfString:@"Mambo"].location != NSNotFound)
        {
            [self unregisterReceivers];
            [self stopDiscovery];
            
            _stateSem = dispatch_semaphore_create(0);
            _service = service;
            
            _miniDrone = [[MiniDrone alloc] initWithService:_service];
            [_miniDrone setDelegate:self];
            [_miniDrone connect];
            
            break;
        }
    }
}

// this should be called in background
- (ARDISCOVERY_Device_t *)createDiscoveryDeviceWithService:(ARService*)service
{
    ARDISCOVERY_Device_t *device = NULL;
    eARDISCOVERY_ERROR errorDiscovery = ARDISCOVERY_OK;
    
    device = [service createDevice:&errorDiscovery];
    
    if (errorDiscovery != ARDISCOVERY_OK)
        NSLog(@"Discovery error :%s", ARDISCOVERY_Error_ToString(errorDiscovery));
    
    return device;
}

- (void)unregisterReceivers
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kARDiscoveryNotificationServicesDevicesListUpdated object:nil];
}

- (void)stopDiscovery
{
    [[ARDiscovery sharedInstance] stop];
}

- (void)disconnectDrone
{
    // in background, disconnect from the drone
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self->_miniDrone disconnect];
        // wait for the disconnection to appear
        dispatch_semaphore_wait(self->_stateSem, DISPATCH_TIME_FOREVER);
        self->_miniDrone = nil;
    });
}

@end
