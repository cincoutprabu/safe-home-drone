# Safe Home Drone

The idea is to build a drone-based home security system prototype, where a drone autonomously takes off and flies around a home building and capture the events in camera, when a security threat is detected.

The prototype includes:

* TI SensorTag 2.0 CC2650
* Parrot Mambo Minidrone
* iOS app written in Objective-C

The SensorTag is used to detect interesting events happening around the home, by capturing the environmental sensor data like temperature, humidiy, pressure, ambient light, etc. The iOS app collects and monitors the sensor data, and dispatches the drone if any anomaly is found in the sensor data. The drone then autonomously flies around the home to capture the events in camera.

When the iOS app is launched, the user needs to connect the iPhone to SensorTag as well as Parrot Mambo drone via Bluetooth. The app also has options to manually control the drone to take-off and land anytime when the drone is flying.

Once dispatched, the drone flies around the home in a time-based rectangular pattern. Assuming the drone is placed at the bottom right corner of a grid:

- The drone takes off and flies forward on the right edge of the rectangle (rightmost column of grid)
- Then turns left and flies forward on the front edge of the rectangle (first row of grid)
- Then turns left and flies forward on the left edge of the rectangle (first column of grid)
- Then turns left and flies forward on the bottom edge of the rectangle (last row of grid)
- And finally lands at the same take-off position.


                                    (4) Fly Forward on Front Edge
                                               < < <
                        (5) Turn Left   + - - - - - - - - +   (3) Turn Left
                                        |                 |
                                        |                 |
                                    v   |                 |    ^
      (6) Fly forward on Left Edge  v   |                 |    ^  (2) Fly Forward on Right Edge
                                    v   |                 |    ^
                                        |                 |
                                        |                 |
                                        |                 |
                        (7) Turn Left   + - - - - - - - - +   (1) Take-Off
                                               > > >          (9) Land
                                    (8) Fly Forward on Bottom Edge


A demonstration video of the prototype is available here:
https://youtube.com/watch?v=Z5no8KJlarE
