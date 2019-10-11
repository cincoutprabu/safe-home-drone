# Safe Home Drone

The idea is to build a drone-based home security system prototype, where a drone autonomously takes off and flies around a home building and capture the events in camera, when a security threat is detected.

The prototype includes:

* TI SensorTag 2.0 CC2650
* Parrot Mambo Minidrone
* iOS app written in Objective-C

The SensorTag is used to detect interesting events happening around the home, by capturing the environmental sensor data like temperature, humidity, pressure, ambient light, etc. The iOS app collects and monitors the sensor data, and dispatches the drone if any anomaly is found in the sensor data. The drone then autonomously flies around the home to capture the events in camera.

When the iOS app is launched on the iPhone or iPad, the app connects to SensorTag as well as Parrot Mambo drone via Bluetooth. The app also has options to manually control the drone to take-off and land anytime when the drone is flying.

Once dispatched, the drone flies around the home in a time-based rectangular pattern. Assuming the drone is placed at the bottom right corner of a grid:

- The drone takes off and flies forward on the right edge of the rectangle (rightmost column of grid)
- Then turns left and flies forward on the front edge of the rectangle (first row of grid)
- Then turns left and flies forward on the left edge of the rectangle (first column of grid)
- Then turns left and flies forward on the bottom edge of the rectangle (last row of grid)
- And finally lands at bottom right corner (same as take-off position).


                                    (04) Fly Forward on Front Edge
                                                < < <
                        (05) Turn Left   + - - - - - - - - +   (03) Turn Left
                                         |                 |
                                         |                 |
                                     v   |                 |    ^
      (06) Fly forward on Left Edge  v   |                 |    ^  (02) Fly Forward on Right Edge
                                     v   |                 |    ^
                                         |                 |
                                         |                 |
                                         |                 |
                        (07) Turn Left   + - - - - - - - - +   (01) Take-Off
                                                > > >          (09) Land
                                    (08) Fly Forward on Bottom Edge


A demonstration video of the prototype is available here: https://youtube.com/watch?v=Z5no8KJlarE

# Screenshots

Before Take-off | Flying Forward on Left Edge | Turning Left towards Bottom Edge | Landed
--- | --- | --- | ---
![Before Take-off](/Screenshots/1-Init.PNG) | ![Flying Forward on Left Edge](/Screenshots/2-Hovering-Left-Forward.PNG) | ![Turning Left towards Bottom Edge](/Screenshots/3-Hovering-Left-Turn.PNG) | ![Landed](/Screenshots/4-Landed.PNG)
