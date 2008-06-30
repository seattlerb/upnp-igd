require 'rubygems'
require 'UPnP/control/service'

class UPnP::Control::Service::WANCommonInterfaceConfig < UPnP::Control::Service

  ##
  # Version 1 URN for WANCommonInterfaceConfig service

  URN_1 = [UPnP::SERVICE_SCHEMA_PREFIX, name.split(':').last, 1].join ':'

end

