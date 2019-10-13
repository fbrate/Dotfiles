/*
Copyright 2017 Danny Nguyen <danny@hexwire.com>
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef CONFIG_USER_H
#define CONFIG_USER_H

#include "config_common.h"

/* Use I2C or Serial, not both */

#define USE_SERIAL
// #define USE_I2C

/* Select hand configuration */

#define MASTER_LEFT
// #define MASTER_RIGHT
#define EE_HANDS



#define TAPPING_TERM 200

#define TAPPING_TOGGLE 1


// constant mousekey settings

#define MK_3_SPEED

// speed 0
#define MK_C_OFFSET_0 4
#define MK_C_INTERVAL_0 13


// speed 1



#define MK_C_OFFSET_1 16
#define MK_C_INTERVAL_1 13

// speed 2

#define MK_C_OFFSET_2 38
#define MK_C_INTERVAL_2 13

// scroll settings

#define PS2_MOUSE_ENABLE_SCROLLING

#define PS2_MOUSE_SCROLL_BTN_MASK (1<<PS2_MOUSE_BTN_MIDDLE)

#define PS2_MOUSE_BTN_MIDDLE 2


#endif

#ifdef PS2_USE_INT
#define PS2_CLOCK_PORT  PORTD
#define PS2_CLOCK_PIN   PIND
#define PS2_CLOCK_DDR   DDRD
#define PS2_CLOCK_BIT   3
#define PS2_DATA_PORT   PORTC
#define PS2_DATA_PIN    PINC
#define PS2_DATA_DDR    DDRC
#define PS2_DATA_BIT    6

#define PS2_INT_INIT()  do {    \
    EICRA |= ((1<<ISC30) |      \
              (0<<ISC21));      \
} while (0)
#define PS2_INT_ON()  do {      \
    EIMSK |= (1<<INT3);         \
} while (0)
#define PS2_INT_OFF() do {      \
    EIMSK &= ~(1<<INT3);        \
} while (0)
#define PS2_INT_VECT   INT3_vect
#endif
