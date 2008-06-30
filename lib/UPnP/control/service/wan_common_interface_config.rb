require 'rubygems'
require 'UPnP/control/service'

##
# A UPnP WAN Common Interface Config service models the physical layer
# properties of a WAN interface on an InternetGatewayDevice.

class UPnP::Control::Service::WANCommonInterfaceConfig < UPnP::Control::Service

  ##
  # Version 1 URN for the WANCommonInterfaceConfig service

  URN_1 = [UPnP::SERVICE_SCHEMA_PREFIX, name.split(':').last, 1].join ':'

end

