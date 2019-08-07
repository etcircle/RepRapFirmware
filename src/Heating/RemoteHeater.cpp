/*
 * RemoteHeater.cpp
 *
 *  Created on: 24 Jul 2019
 *      Author: David
 */

#include "RemoteHeater.h"

#if SUPPORT_CAN_EXPANSION

#include "CAN/CanMessageGenericConstructor.h"

void RemoteHeater::Spin()
{
}

void RemoteHeater::ResetHeater()
{
}

GCodeResult RemoteHeater::ConfigurePortAndSensor(GCodeBuffer& gb, const StringRef& reply)
{
	CanMessageGenericConstructor cons(M950Params);
	if (!cons.PopulateFromCommand(gb, reply))
	{
		return GCodeResult::error;
	}
	return cons.SendAndGetResponse(CanMessageType::m950, boardAddress, reply);
}

// If it's a local heater, turn it off and release its port. If it is remote, delete the remote heater.
void RemoteHeater::ReleasePort()
{
	//TODO
}

void RemoteHeater::SwitchOff()
{
}

void RemoteHeater::ResetFault()
{
}

float RemoteHeater::GetTemperature() const
{
	return 0.0;
}

float RemoteHeater::GetAveragePWM() const
{
	return 0.0;		// not yet supported
}

// Return the integral accumulator
float RemoteHeater::GetAccumulator() const
{
	return 0.0;		// not yet supported
}

void RemoteHeater::StartAutoTune(float targetTemp, float maxPwm, const StringRef& reply)
{
}

void RemoteHeater::GetAutoTuneStatus(const StringRef& reply) const
{
}

void RemoteHeater::Suspend(bool sus)
{
}

Heater::HeaterMode RemoteHeater::GetMode() const
{
	return HeaterMode::off;
}

void RemoteHeater::SwitchOn()
{
}

// This is called when the heater model has been updated. Returns true if successful.
GCodeResult RemoteHeater::UpdateModel(const StringRef& reply)
{
	//TODO send UpdateModel message
	reply.copy("UpdateModel not implemented yet");
	return GCodeResult::error;
}

#endif

// End
