// masterUUIDList.h

///@brief The masterUUIDList.h contains all a comprehensive list of Bluetooth Smart UUIDs for use in applications.

#ifndef SensorTag2_Example_masterUUIDList_h
#define SensorTag2_Example_masterUUIDList_h

#define BT_SIG_TX_POWER_SERVICE 							@"1804"
#define BT_SIG_TX_POWER_LEVEL	 							@"2A07"

#define BT_SIG_DEVICE_INFO_SERVICE 							@"180A"
#define BT_SIG_DEVICE_INFO_SYSTEM_ID 						@"2A23"
#define BT_SIG_DEVICE_INFO_MODEL_NR							@"2A24"
#define BT_SIG_DEVICE_INFO_SERIAL_NR						@"2A25"
#define BT_SIG_DEVICE_INFO_FIRMWARE_REV						@"2A26"
#define BT_SIG_DEVICE_INFO_HARDWARE_REV						@"2A27"
#define BT_SIG_DEVICE_INFO_SOFTWARE_REV						@"2A28"
#define BT_SIG_DEVICE_INFO_MANIFACTURER_NAME				@"2A29"
#define BT_SIG_DEVICE_INFO_IEEE_11073						@"2A2A"
#define BT_SIG_DEVICE_INFO_PNP_ID							@"2A50"

#define BT_SIG_IMMEDIATE_ALERT_SERVICE						@"1802"
#define BT_SIG_IMMEDIATE_ALERT_ALERT_LEVEL					@"2A06"

#define BT_SIG_BATTERY_SERVICE								@"180F"
#define BT_SIG_BATTERY_BATTERY_LEVEL						@"2A19"

#define BT_SIG_GLUCOSE_SERVICE								@"1808"
#define BT_SIG_GLUCOSE_MEASUREMENT							@"2A18"
#define BT_SIG_GLUCOSE_MEASUREMENT_CONTEXT					@"2A34"
#define BT_SIG_GLUCOSE_FEATURE								@"2A51"
#define BT_SIG_GLUCOSE_RECORD_ACCESS_CONTROL_POINT			@"2A52"

#define BT_SIG_HEALTH_THERMOMETER_SERVICE					@"1809"
#define BT_SIG_HEALTH_THERMOMETER_MEASUREMENT				@"2A1C"
#define BT_SIG_HEALTH_THERMOMETER_TYPE						@"2A1D"
#define BT_SIG_HEALTH_THERMOMETER_INTERMEDIATE_TEMPERATURE	@"2A1E"
#define BT_SIG_HEALTH_THERMOMETER_MEASUREMENT_INTERVAL		@"2A21"

#define BT_SIG_HEART_RATE_SERVICE							@"180D"
#define BT_SIG_HEART_RATE_MEASUREMENT						@"2A37"
#define BT_SIG_HEART_RATE_BODY_SENSOR_LOCATION				@"2A38"
#define BT_SIG_HEART_RATE_CONTROL_POINT						@"2A39"

#define BT_SIG_BLOOD_PRESSURE_SERVICE						@"1810"
#define BT_SIG_BLOOD_PRESSURE_MEASUREMENT					@"2A35"
#define BT_SIG_BLOOD_PRESSURE_INTERMEDIAE_CUFF_PRESSURE		@"2A36"
#define BT_SIG_BLOOD_PRESSURE_FEATURE						@"2A49"

#define BT_SIG_RSC_SERVICE									@"1814"
#define BT_SIG_RSC_MEASUREMENT								@"2A53"
#define BT_SIG_RSC_FEATURE									@"2A54"
#define BT_SIG_RSC_SENSOR_LOCATION							@"2A5D"
#define BT_SIG_RSC_CONTROL_POINT							@"2A55"

#define BT_SIG_CSC_SERVICE									@"1816"
#define BT_SIG_CSC_MEASUREMENT								@"2A5B"
#define BT_SIG_CSC_FEATURE									@"2A5C"
#define BT_SIG_CSC_SENSOR_LOCATION							@"2A5D"
#define BT_SIG_CSC_CONTROL_POINT							@"2A55"


#define TI_SIMPLE_KEYS_SERVICE								@"FFE0"
#define TI_SIMPLE_KEYS_KEY_PRESS_STATE						@"FFE1"

#define TI_SENSORTAG_TEMPERATURE_SERVICE					@"F000AA00-0451-4000-B000-000000000000"
#define TI_SENSORTAG_IR_TEMPERATURE_DATA					@"F000AA01-0451-4000-B000-000000000000"
#define TI_SENSORTAG_IR_TEMPERATURE_CONFIG					@"F000AA02-0451-4000-B000-000000000000"
#define TI_SENSORTAG_IR_TEMPERATURE_PERIOD					@"F000AA03-0451-4000-B000-000000000000"

#define TI_SENSORTAG_ACCELEROMETER_SERVICE					@"F000AA10-0451-4000-B000-000000000000"
#define TI_SENSORTAG_ACCELEROMETER_DATA						@"F000AA11-0451-4000-B000-000000000000"
#define TI_SENSORTAG_ACCELEROMETER_CONFIG					@"F000AA12-0451-4000-B000-000000000000"
#define TI_SENSORTAG_ACCELEROMETER_PERIOD					@"F000AA13-0451-4000-B000-000000000000"

#define TI_SENSORTAG_HUMIDTIY_SERVICE						@"F000AA20-0451-4000-B000-000000000000"
#define TI_SENSORTAG_HUMIDTIY_DATA							@"F000AA21-0451-4000-B000-000000000000"
#define TI_SENSORTAG_HUMIDTIY_CONFIG						@"F000AA22-0451-4000-B000-000000000000"
#define TI_SENSORTAG_HUMIDTIY_PERIOD						@"F000AA23-0451-4000-B000-000000000000"

#define TI_SENSORTAG_MAGNETOMETER_SERVICE					@"F000AA30-0451-4000-B000-000000000000"
#define TI_SENSORTAG_MAGNETOMETER_DATA						@"F000AA31-0451-4000-B000-000000000000"
#define TI_SENSORTAG_MAGNETOMETER_CONFIG					@"F000AA32-0451-4000-B000-000000000000"
#define TI_SENSORTAG_MAGNETOMETER_PERIOD					@"F000AA33-0451-4000-B000-000000000000"

#define TI_SENSORTAG_BAROMETER_SERVICE						@"F000AA40-0451-4000-B000-000000000000"
#define TI_SENSORTAG_BAROMETER_DATA							@"F000AA41-0451-4000-B000-000000000000"
#define TI_SENSORTAG_BAROMETER_CONFIG						@"F000AA42-0451-4000-B000-000000000000"
#define TI_SENSORTAG_BAROMETER_CALIBRATION					@"F000AA43-0451-4000-B000-000000000000"
#define TI_SENSORTAG_BAROMETER_PERIOD						@"F000AA44-0451-4000-B000-000000000000"


#define TI_SENSORTAG_GYROSCOPE_SERVICE						@"F000AA50-0451-4000-B000-000000000000"
#define TI_SENSORTAG_GYROSCOPE_DATA							@"F000AA51-0451-4000-B000-000000000000"
#define TI_SENSORTAG_GYROSCOPE_CONFIG						@"F000AA52-0451-4000-B000-000000000000"
#define TI_SENSORTAG_GYROSCOPE_PERIOD						@"F000AA53-0451-4000-B000-000000000000"

#define TI_SENSORTAG_IO_SERVICE                             @"F000AA64-0451-4000-B000-000000000000"
#define TI_SENSORTAG_IO_DATA                                @"F000AA65-0451-4000-B000-000000000000"
#define TI_SENSORTAG_IO_CONFIG                              @"F000AA66-0451-4000-B000-000000000000"


#define TI_SENSORTAG_TWO_LIGHT_SENSOR_SERVICE				@"F000AA70-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_LIGHT_SENSOR_DATA					@"F000AA71-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_LIGHT_SENSOR_CONFIG				@"F000AA72-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_LIGHT_SENSOR_PERIOD				@"F000AA73-0451-4000-B000-000000000000"

#define TI_SENSORTAG_TWO_MOVEMENT_SERVICE					@"F000AA80-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_MOVEMENT_DATA						@"F000AA81-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_MOVEMENT_CONFIG					@"F000AA82-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_MOVEMENT_PERIOD					@"F000AA83-0451-4000-B000-000000000000"

#define TI_SENSORTAG_TWO_REGISTER_SERVICE					@"F000AC00-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_REGISTER_DATA                      @"F000AC01-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_REGISTER_ADDRESS					@"F000AC02-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_REGISTER_DEVICE_ID					@"F000AC03-0451-4000-B000-000000000000"

#define TI_SENSORTAG_TWO_DISPLAY_SERVICE					@"F000AD00-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_DISPLAY_DATA						@"F000AD01-0451-4000-B000-000000000000"
#define TI_SENSORTAG_TWO_DISPLAY_CONTROL					@"F000AD02-0451-4000-B000-000000000000"

#define TI_ACCELEROMETER_SERVICE							@"FFA0"
#define TI_ACCELEROMETER_ENABLE								@"FFA1"
#define TI_ACCELEROMETER_RANGE								@"FFA2"
#define TI_ACCELEROMETER_X_DATA								@"FFA3"
#define TI_ACCELEROMETER_Y_DATA								@"FFA4"
#define TI_ACCELEROMETER_Z_DATA								@"FFA5"

#define TI_RACING_CAR_SERVICE								@"ACC0"
#define TI_RACING_CAR_THROTTLE								@"ACC1"
#define TI_RACING_CAR_STEERING								@"ACC2"
#define TI_RACING_CAR_LIGHTS_HORN							@"ACC3"

#define TI_LAMP_CONTROL_SERVICE								@"FFB0"
#define TI_LAMP_CONTROL_RED_DATA							@"FFB1"
#define TI_LAMP_CONTROL_GREEN_DATA							@"FFB2"
#define TI_LAMP_CONTROL_BLUE_DATA							@"FFB3"
#define TI_LAMP_CONTROL_WHITE_DATA							@"FFB4"
#define TI_LAMP_CONTROL_COMPOUND_DATA						@"FFB5"

#define TI_OAD_SERVICE										@"F000FFC0-0451-4000-B000-000000000000"
#define TI_OAD_IMAGE_NOTIFY									@"F000FFC1-0451-4000-B000-000000000000"
#define TI_OAD_IMAGE_BLOCK_REQUEST							@"F000FFC2-0451-4000-B000-000000000000"

#define TI_CONNECTION_CONTROL_SERVICE						@"F000CCC0-0451-4000-B000-000000000000"
#define TI_CONNECTION_CONTROL_CURRENT_USED_PARAMETERS		@"F000CCC1-0451-4000-B000-000000000000"
#define TI_CONNECTION_CONTROL_REQUEST_NEW_PARAMETERS		@"F000CCC2-0451-4000-B000-000000000000"
#define TI_CONNECTION_CONTROL_DISCONNECT_REQUEST			@"F000CCC3-0451-4000-B000-000000000000"
#define TI_CONNECTION_CONTROL_NAP_INTERVAL_SETTING			@"F000CCC4-0451-4000-B000-000000000000"

#define TI_IBEACON_CONFIGURATION_SERVICE					@"F000BCC0-0451-4000-B000-000000000000"
#define TI_IBEACON_UUID_SETTING								@"F000BCC1-0451-4000-B000-000000000000"
#define TI_IBEACON_MAJOR_ID_SETTING							@"F000BCC2-0451-4000-B000-000000000000"
#define TI_IBEACON_MINOR_ID_SETTING							@"F000BCC3-0451-4000-B000-000000000000"
#define TI_IBEACON_CALIB_TX_POWER_SETTING					@"F000BCC4-0451-4000-B000-000000000000"
#define TI_IBEACON_BROADCAST_INTERVAL						@"F000BCC5-0451-4000-B000-000000000000"
#define TI_IBEACON_ENABLE									@"F000BCC6-0451-4000-B000-000000000000"


#endif
