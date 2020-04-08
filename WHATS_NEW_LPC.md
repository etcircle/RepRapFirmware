Summary of LPC specific changes
===============================================

Version 3.01 RC5
==============
* Updated with latest RC5 from DC42. 


Version 3.01 RC4
==============
* Added initial experimental support for SBC interface

* Added configurable UART class to allow selecting UART from board config by using the RX/TX pins for AUX serial and WIFI Serial.
    * AUX serial pins will default to the UART0 pins as it has done in previous versions. Setting Aux serial to NoPin, NoPin can save a bit of memory as the buffers won't be created.
    * New board.txt entries:
        * 8266wifi.serialRxTxPins - array of pins {RX, TX} (Requires WIFI to be compiled into binary)
        * serial.aux.rxTxPins - array of pins {RX, TX}
        * serial.aux2.rxTxPins - array of pins {RX, TX}  (Requires AUX2 to be compiled into binary)

* Added board.txt entry "heat.spiTempSensorChannel" to select the spi channel for the SPI Temperature sensors. Defaults to SSP0.

### Changed board entries
For naming consistancy, the following board.txt entries have been changed:
| New  | Previous   |
|---|---|
| atx.powerPin  | atxPowerPin  |
| atx.powerPinInverted  | atxPowerPinInverted  |
| sdCard.internal.spiFrequencyHz | lpc.internalSDCard.spiFrequencyHz   |
| sdCard.external.csPin  | externalSDCard.csPin  |
| sdCard.external.cardDetectPin  | externalSDCard.cardDetectPin  |
| sdCard.external.spiFrequencyHz  | lpc.externalSDCard.spiFrequencyHz  |
| sdCard.external.spiChannel  | lpc.externalSDCard.spiChannel  |
| softwareSPI.pins  | lpc.softwareSPI.pins  |
| 8266wifi.espDataReadyPin  | 8266wifi.EspDataReadyPin  |
| 8266wifi.lpcTfrReadyPin  | 8266wifi.LpcTfrReadyPin  |
| 8266wifi.espResetPin| 8266wifi.EspResetPin |
| 8266wifi.serialRxTxPins  | 8266wifi.SerialRxTxPins  |
| sbc.lpcTfrReadyPin  | linuxTfrReadyPin  |
| adc.prefilter.enable  | lpc.adcEnablePreFilter  |
| adc.preFilter.numberSamples  | lpc.adcPreFilterNumberSamples |
| adc.preFilter.sampleRate | lpc.adcPreFilterSampleRate |

  


Version 3.01 RC3
================
* Added new build option TMC22XX set to true to provide support for TMC22XX drivers via the UART interface.
* Added new build option ESP8266WIFI_SERIAL (available when usinf ESP8266 WiFi) define this to use enable the UART interface to the ESP8266 board. Note that on SKR based boards only a single UART device is easily available and so to allow the use of panel due and other serial based control screens this option should not be enabled.
* New pin names. The pin names used for the various boards has been updated to provided a consistant naming policy across different boards.


Version 3.01 Beta2
=================

* Removed board.txt entry: stepper.hasDriverCurrentControl. Now relies on stepper.digipotFactor being set to enable current control.

Version 3.01 beta1
=================

* Added new board.txt entry "lpc.adcEnablePreFilter" to enable/disable the ADC prefilter. [Experimental]


Version 3.0 beta13
=================

* Implemented DMA. SharedSPI updated to use DMA for SSP and also blocks while waiting to complete (or timeout) so RTOS can process other tasks while watiting
* Removed lpc.uartPanelDueMode as M575 supports new raw mode from 3.0b13.
* Added new board.txt entries for ESP8266Wifi:
    * 8266wifi.EspDataReadyPin - this pin needs to be on Port 0 or Port 2 as it uses external interrupts
    * 8266wifi.LpcTfrReadyPin
    * 8266wifi.EspResetPin



Version 3.0 beta3
=================


### Board Config (board.txt)

* Removed Fan Pins, Heater Pins, Tacho pins and Endstops configuration options as they are now configurable by GCode (See GCode M950) and needs to be set in config.g (See https://duet3d.dozuki.com/Wiki/RepRapFirmware_3_overview).
* Removed SpecialPins as it's no longer required in RRF3. M950 is now used to create a "gpio port number", and that gpio port number is used in M42 and M280.
* Removed lpc.externalInterruptPins config. It is now done automatially when attempting to attach an interrupt to a pin on port 0 or port 2 (i.e. for Fan Tacho pin or configuring a filament detector).
* Removed lpc.slowPWM.pins, lpc.fastPWM.pins and lpc.servoPins. They are now assigned automatically when using M950.
* PWM for heaters and fans are now generated using a free running timer. This allows creating different PWM with frequencies instead of being limited to 2 options.  
* Added new entry: lpc.board. Currently supported values are: smoothieboard, rearm,  mkssbase_1.3, azsmzmini, biquskr_1.1, biquskr_1.3, azteegx5mini_1.1 and generic.  For example: lpc.board = smoothieboard;
    * Currently does not support control of drivers via UART/SPI on Biqu SKR 1.3. 
    * When defining a board, the names on the silk screen (or official pinout if there is no names on the silk) can be used in M950. LPC style of port.pin (i.e. 1.23) can also be used if desired, however.
    * For ReArm, the silk on the RAMPs shield is used and additionally support from the official pinout that uses arduino mega naming can be used, i.e. D8, etc.
    * For the above boards (except generic), some defaults are included in the firmware for stepper pins (en/step/dir), current control and will be used as the default. They can be overriden by defining those variables in board.txt.
    * The generic board has no defaults. 
* Added new atxPowerPinInverted entry which is set to true or false.  Set to true if the PSON needs to be inverted. Default is False.
* Added new lpc.externalSDCard.spiChannel to select which hardware SSP pins are used for SDCard. Must be 0 to select SSP0 or 1 to select SSP1. Default is SSP1.


Version 2.04RC1
=================

### Board Config (Board.txt)
* Software SPI added. New pin arrary option:  lpc.softwareSPI.pins
    * Assigns GPIO pins to operate as SoftwareSPI.
    * Default Value: lpc.softwareSPI.pins = {NoPin, NoPin, NoPin} ; //Set to GPIO pins to use as SCK, MISO, MOSI
* New SPI Channel options added for ExternalSDCard and LCD. Channel 0 = SSP0, 1 = SSP1 and 2 = SoftwareSPI
    * lpc.externalSDCard.spiChannel option added to select SPI Channel external SDCard uses.
    * lcd.spiChannel option added to select SPI Channel LCD uses (typically 0 or 2). Default



Version 2.03
=================

### SDCard

* Updated functions for SDCard and SharedSPI to improve performance now using ChaN 2018 routines. Includes 16bit block transfers and takes advantage of the LPC SSP 8 frame FIFOs. 
* Added detection for SDCards that support HighSpeed mode which enables the card interface SPI speeds up to 50MHz.
* Added check to ensure that if user enters a higher SPI frequency than the card can support to only use the max card speed.
* If users select a slower SPI speed than the card can handle, that speed will instead be used (i.e. to have slower SPI speeds over long cables for external SDCard slot if desired).
* Implemented SDCard read/write retries as RRF does.

### Networking

* Fixed a bug causing a buffer to not be freed after a read socket error.
* Added mutexes to the callbacks which are called from a different task (IPTask).
* Upgraded FreeRTOS+TCP to V2.0.11
* Added extra FreeRTOS priorty and changed priories so the EMac task has a higher priority than IPTask.   
* Removed the f_expand to preallocate space as it takes longer than the default network time out when uploading large files.