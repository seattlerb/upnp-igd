require 'rubygems'
require 'UPnP/control/service'

class UPnP::Control::Service::WANIPConnection < UPnP::Control::Service

  ##
  # Version 1 URN for WANIPConnection

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

