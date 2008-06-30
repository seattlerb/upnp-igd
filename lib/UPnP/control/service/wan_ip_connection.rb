require 'rubygems'
require 'UPnP/control/service'

##
# The UPnP WAN IP Connection service.
#
# This service is used to configure and control IP connections on the WAN
# device of an InternetGatewayDevice.

class UPnP::Control::Service::WANIPConnection < UPnP::Control::Service

  ##
  # Version 1 URN for the WANIPConnection

  URN_1 = [UPnP::SERVICE_SCHEMA_PREFIX, name.split(':').last, 1].join ':'

  ##
  # Collects all the port mappings via GetGenericPortMappingEntry and returns
  # an Array containing each response.

  def port_mappings
    port_mappings = []
    i = 0

    loop do
      port_mappings << GetGenericPortMappingEntry(i)
      i += 1
    end
  rescue UPnP::Control::Service::UPnPError => e
    raise unless e.code == 713
    port_mappings
  end

end

