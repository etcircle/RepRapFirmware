################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Platform.cpp \
../RepRapFirmware.cpp 

CPP_DEPS += \
./Platform.cpp.d \
./RepRapFirmware.cpp.d 

LINK_OBJ += \
./Platform.cpp.o \
./RepRapFirmware.cpp.o 


# Each subdirectory must supply rules for building sources it contributes
Platform.cpp.o: ../Platform.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jeanmarc/arduino-1.5.2/hardware/tools/g++_arm_none_eabi/bin/arm-none-eabi-g++" -c -g -Os -w -ffunction-sections -fdata-sections -nostdlib --param max-inline-insns-single=500 -fno-rtti -fno-exceptions -Dprintf=iprintf -mcpu=cortex-m3 -DF_CPU=84000000L -DARDUINO=152 -D__SAM3X8E__ -mthumb -DUSB_PID=0x003e -DUSB_VID=0x2341 -DUSBCON "-I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/system/libsam" "-I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/system/CMSIS/CMSIS/Include/" "-I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/system/CMSIS/Device/ATMEL/"   -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/cores/arduino" -I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/variants/arduino_due_x" -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries/Ethernet" -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries/Ethernet/utility" -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries/SPI" -I"/home/jeanmarc/arduino-1.5.2/libraries/SD" -I"/home/jeanmarc/arduino-1.5.2/libraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '

RepRapFirmware.cpp.o: ../RepRapFirmware.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"/home/jeanmarc/arduino-1.5.2/hardware/tools/g++_arm_none_eabi/bin/arm-none-eabi-g++" -c -g -Os -w -ffunction-sections -fdata-sections -nostdlib --param max-inline-insns-single=500 -fno-rtti -fno-exceptions -Dprintf=iprintf -mcpu=cortex-m3 -DF_CPU=84000000L -DARDUINO=152 -D__SAM3X8E__ -mthumb -DUSB_PID=0x003e -DUSB_VID=0x2341 -DUSBCON "-I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/system/libsam" "-I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/system/CMSIS/CMSIS/Include/" "-I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/system/CMSIS/Device/ATMEL/"   -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/cores/arduino" -I/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/variants/arduino_due_x" -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries/Ethernet" -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries/Ethernet/utility" -I"/home/jeanmarc/arduino-1.5.2/hardware/arduino/sam/libraries/SPI" -I"/home/jeanmarc/arduino-1.5.2/libraries/SD" -I"/home/jeanmarc/arduino-1.5.2/libraries/SD/utility" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


