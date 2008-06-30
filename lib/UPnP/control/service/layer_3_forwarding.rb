require 'rubygems'
require 'UPnP/control/service'

##
# The UPnP Layer 3 Forwarding service models layer-3 packet forwarding
# services for a WANDevice.

class UPnP::Control::Service::Layer3Forwarding < UPnP::Control::Service

  ##
  # Version 1 URN for the Layer3Forwarding service

  URN_1 = [UPnP::SERVICE_SCHEMA_PREFIX, name.split(':').last, 1].join ':'

end

