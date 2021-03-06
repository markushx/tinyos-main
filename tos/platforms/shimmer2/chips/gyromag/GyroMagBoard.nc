/*
 * Copyright (c) 2010, Shimmer Research, Ltd.
 * All rights reserved
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:

 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *     * Neither the name of Shimmer Research, Ltd. nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * @author  Steve Ayer
 * @date    March, 2010
 */

interface GyroMagBoard {
  // gyroboard stuff first
  command void ledOn();
  command void ledOff();
  command void ledToggle();

  // for gyro, use use GyroStdControl, see platform's GyroMagBoardC
  command void gyroAutoZero();

  // magnetometer uses its own stdcontrol, see platform's GyroMagBoardC

  // 0.5, 1, 2, 5, 10 (default), 20, 50hz.  20 and 50 up power burn dramatically
  command error_t setMagOutputRate(uint8_t rate);

  // +-0.7, 1.0 (default), 1.5, 2.0, 3.2, 3.8, 4.5Ga
  command error_t setMagGain(uint8_t gain);

  command error_t setMagIdle();
  command error_t magGoToSleep();

  command error_t magRunSingleConversion();

  command error_t magRunContinuousConversion();

  // call to clock out data; collect it from the "done" event
  command error_t readMagData();

  // convert raw data to heading
  command uint16_t readMagHeading(uint8_t * readBuf);

  // read result after readdone event
  command void magSelfTest();

  // call this to see three-axis magnetometer values
  command void convertMagRegistersToData(uint8_t * readBuf, int16_t * data);

  // this is where the app will find its mag readings
  event void magReadDone(uint8_t * data, error_t success);
  
  event void magWriteDone(error_t success);

  // it has its own, just a reflection of UserButton.fired(), which is debounced
  async event void buttonPressed();

  //  event void magReady();

  command void writeReg(uint8_t reg_addr, uint8_t val);
  
  //  command error_t readValues(uint8_t reg_addr, uint8_t size, uint8_t * data);
  //  command error_t readValues(uint8_t size, uint8_t * data);

  //  command error_t poke(uint8_t val);
  //  command error_t peek(uint8_t * val);

}




