= UPnP-IGD

* http://seattlerb.org/UPnP-IGD
* Eric Hodel drbrain@segment7.net
* http://www.upnp.org/standardizeddcps/igd.asp
* Bugs: http://rubyforge.org/tracker/?atid=5921&group_id=1513

== DESCRIPTION:

A UPnP extension for Internet Gateway Devices

== FEATURES/PROBLEMS:

* Command-line utility that displays information about a UPnP gateway
* Example of using some UPnP APIs
* Does not set anything on the device

== SYNOPSIS:

  $ upnp_igd
  Gateway at http://10.1.1.1/
  Connected, up since 2008-06-29 03:31:00 (66123 seconds)
  Connection type: IP_Routed
  384 Kb/s up, 1536 Kb/s down
  External IP address: 10.255.255.254
  
  Port mappings:
  0 UDP *:4502  -> 10.1.1.2:4500  "iC4502"
  1 UDP *:5355  -> 10.1.1.2:5353  "iC5355"
  2 UDP *:58712 -> 10.1.1.3:58712 "Skype UDP at 10.1.1.3:58712 (546)"
  3 TCP *:58712 -> 10.1.1.3:58712 "Skype TCP at 10.1.1.3:58712 (546)"
  4 UDP *:5353  -> 10.1.1.4:5353  "iC5353"

== REQUIREMENTS:

* A UPnP gateway device

== INSTALL:

* sudo gem install UPnP-IGD

== LICENSE:

All code copyright 2008 Eric Hodel.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the names of the authors nor the names of their contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND ANY EXPRESS
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

