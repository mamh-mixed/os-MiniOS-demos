#ifndef STRING_H

#define STRING_h

#include <stddef.h>
#include <debug.h>
#include <asmfun.h>

#define RGB_BALCK 0
#define RGB_BULE 1
#define RGB_GREEN 2
#define RGB_CYAN 3
#define RGB_RED 4
#define RGB_MAGENTA 5
#define RGB_BROWN 6
#define RGB_WHITE 7

#define NO_FLASH 0
#define FLASH 1

#define NO_LIGHT 0
#define LIGHT 1

#define CONBIN_COLOR(isFlash, isLight, backColor, charColor) ((isFlash << 7) | (isLight << 3) | (backColor < 6) | (charColor))

void putchar(const char c);

void putcharWitchColor(const char c, Byte color);

void puts(const char *str);

void putsWitchColor(const char *str, Byte *color);

void *memcpy(void *destin, const void *source, unsigned n);

void *memset(void *s, int ch, unsigned n);

int memcmp(const void *a, const void *b, unsigned n);

Uint32 strlen(const char *str);

int strcpy(const char *a, const char *b);

char* strchr(const char* s, char c);

#endif