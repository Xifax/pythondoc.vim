*mm.pyx*                                      Last change: 2023 Sep 15

Multimedia Services
*******************

The modules described in this chapter implement various algorithms or
interfaces that are mainly useful for multimedia applications.  They
are available at the discretion of the installation.  Here’s an
overview:

* "wave" — Read and write WAV files

  * "open()"

  * "Error"

  * Wave_read Objects

    * "Wave_read"

      * "Wave_read.close()"

      * "Wave_read.getnchannels()"

      * "Wave_read.getsampwidth()"

      * "Wave_read.getframerate()"

      * "Wave_read.getnframes()"

      * "Wave_read.getcomptype()"

      * "Wave_read.getcompname()"

      * "Wave_read.getparams()"

      * "Wave_read.readframes()"

      * "Wave_read.rewind()"

      * "Wave_read.getmarkers()"

      * "Wave_read.getmark()"

      * "Wave_read.setpos()"

      * "Wave_read.tell()"

  * Wave_write Objects

    * "Wave_write"

      * "Wave_write.close()"

      * "Wave_write.setnchannels()"

      * "Wave_write.setsampwidth()"

      * "Wave_write.setframerate()"

      * "Wave_write.setnframes()"

      * "Wave_write.setcomptype()"

      * "Wave_write.setparams()"

      * "Wave_write.tell()"

      * "Wave_write.writeframesraw()"

      * "Wave_write.writeframes()"

* "colorsys" — Conversions between color systems

  * "rgb_to_yiq()"

  * "yiq_to_rgb()"

  * "rgb_to_hls()"

  * "hls_to_rgb()"

  * "rgb_to_hsv()"

  * "hsv_to_rgb()"

vim:tw=78:ts=8:ft=help:norl: