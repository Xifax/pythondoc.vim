*colorsys.pyx*                                Last change: 2023 Sep 15

"colorsys" — Conversions between color systems
**********************************************

**Source code:** Lib/colorsys.py

======================================================================

The "colorsys" module defines bidirectional conversions of color
values between colors expressed in the RGB (Red Green Blue) color
space used in computer monitors and three other coordinate systems:
YIQ, HLS (Hue Lightness Saturation) and HSV (Hue Saturation Value).
Coordinates in all of these color spaces are floating point values.
In the YIQ space, the Y coordinate is between 0 and 1, but the I and Q
coordinates can be positive or negative.  In all other spaces, the
coordinates are all between 0 and 1.

See also:

  More information about color spaces can be found at
  https://poynton.ca/ColorFAQ.html and
  https://www.cambridgeincolour.com/tutorials/color-spaces.htm.

The "colorsys" module defines the following functions:

colorsys.rgb_to_yiq(r, g, b)              *rgb_to_yiq()..colorsys.pyx*

   Convert the color from RGB coordinates to YIQ coordinates.

colorsys.yiq_to_rgb(y, i, q)              *yiq_to_rgb()..colorsys.pyx*

   Convert the color from YIQ coordinates to RGB coordinates.

colorsys.rgb_to_hls(r, g, b)              *rgb_to_hls()..colorsys.pyx*

   Convert the color from RGB coordinates to HLS coordinates.

colorsys.hls_to_rgb(h, l, s)              *hls_to_rgb()..colorsys.pyx*

   Convert the color from HLS coordinates to RGB coordinates.

colorsys.rgb_to_hsv(r, g, b)              *rgb_to_hsv()..colorsys.pyx*

   Convert the color from RGB coordinates to HSV coordinates.

colorsys.hsv_to_rgb(h, s, v)              *hsv_to_rgb()..colorsys.pyx*

   Convert the color from HSV coordinates to RGB coordinates.

Example:
>
   >>> import colorsys
   >>> colorsys.rgb_to_hsv(0.2, 0.4, 0.4)
   (0.5, 0.5, 0.4)
   >>> colorsys.hsv_to_rgb(0.5, 0.5, 0.4)
   (0.2, 0.4, 0.4)
<
vim:tw=78:ts=8:ft=help:norl: