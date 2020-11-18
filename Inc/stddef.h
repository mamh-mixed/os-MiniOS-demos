#ifndef __STDDEF_H__

#define __STDDEF_H__

#define NULL ((void *)0)

#define FALSE (0)

#define TRUE (1)

#define GDT_SELECTOR_DPL_0_4GB_CODE 0x10

#define GDT_SELECTOR_DPL_0_4GB_DATA 0x08

#define GDT_SELECTOR_DPL_0_4GB_STACK 0x20

typedef unsigned char Bool;

typedef unsigned char Byte;

typedef unsigned char Uint8;

typedef unsigned short Uint16;

typedef unsigned int Uint32;

typedef char Int8;

typedef short Int16;

typedef int Int32;

#endif