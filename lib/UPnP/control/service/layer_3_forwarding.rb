require 'rubygems'
require 'UPnP/control/service'

class UPnP::Control::Service::Layer3Forwarding < UPnP::Control::Service

  ##
  # Version 1 URN for Layer3Forwarding service

  URN_1 = [UPnP::SERVICE_SCHEMA_PREFIX, name.split(':').last, 1].join ':'

end

