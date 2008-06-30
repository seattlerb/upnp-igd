require 'rubygems'
require 'UPnP/control/device'
require 'UPnP/control/service/layer_3_forwarding'
require 'UPnP/control/service/wan_ip_connection'
require 'UPnP/control/service/wan_common_interface_config'

##
# A UPnP Internet Gateway Device control point that provides friendly
# accessors to its component services and provides a handy method to dump
# information about the device.
#
# http://www.upnp.org/standardizeddcps/igd.asp

class UPnP::Control::Device::InternetGatewayDevice < UPnP::Control::Device

  ##
  # The version of UPnP-IGD you are using

  VERSION = '1.0.0'

  ##
  # Version 1 URN for InternetGatewayDevice

  URN_1 = [UPnP::DEVICE_SCHEMA_PREFIX, name.split(':').last, 1].join ':'

  ##
  # Prints a summary of this gateway devices status to $stdout

  def print_info
    puts "Gateway at #{presentation_url || url}"

    status, last_error, uptime = wic.GetStatusInfo

    up_at = (Time.now - uptime).strftime "%Y-%m-%d %H:%M:%S"
    puts "#{status}, up since #{up_at} (#{uptime} seconds)"

    case status
    when 'Connected', 'PendingDisconnect' then
      connection_type, = wic.GetConnectionTypeInfo
      puts "Connection type: #{connection_type}"

      _, upstream, downstream, = wcic.GetCommonLinkProperties
      puts "#{upstream / 1024} Kb/s up, #{downstream / 1024} Kb/s down"

      external_ip = wic.GetExternalIPAddress
      puts "External IP address: #{external_ip}"

      port_mappings = wic.port_mappings

      index_length = port_mappings.length.to_s.length

      e_host_length = port_mappings.map { |port| port[0].length }.max
      e_host_length = 1 if e_host_length.zero?

      i_host_length = port_mappings.map { |port| port[4].length }.max

      puts
      puts "Port mappings:"
      port_mappings.each_with_index do |port, i|
        e_host, e_port, proto, i_port, i_host, enabled, descr, duration = port
        e_host = '*' if e_host.empty?

        puts "%*d %s %*s:%-5d -> %*s:%-5d \"%s\"" % [
          index_length, i,
          proto,
          e_host_length, e_host, e_port,
          i_host_length, i_host, i_port,
          descr
        ]
      end
    end

    puts
  end

  ##
  # An accessor for the Layer3Forwarding service

  def layer_3_forwarding
    @l3f ||= services.find do |service|
      service.type == UPnP::Control::Service::Layer3Forwarding::URN_1
    end

    @l3f
  end

  ##
  # An accessor for the Layer3Forwarding service

  alias l3f layer_3_forwarding

  ##
  # An accessor for the WANCommonInterfaceConfig service

  def wan_common_interface_config
    @wcic ||= services.find do |service|
      UPnP::Control::Service::WANCommonInterfaceConfig === service
    end

    @wcic
  end

  ##
  # An accessor for the WANCommonInterfaceConfig service

  alias wcic wan_common_interface_config

  ##
  # An accessor for the WANIPConnection service

  def wan_ip_connection
    @wip ||= services.find do |service|
      UPnP::Control::Service::WANIPConnection === service
    end

    @wip
  end

  ##
  # An accessor for the WANIPConnection service

  alias wic wan_ip_connection

end

