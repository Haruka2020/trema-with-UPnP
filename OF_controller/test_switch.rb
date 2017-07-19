require 'fdb'
require 'pry'

# An OpenFlow controller that emulates a layer-2 switch.
class LearningSwitch < Trema::Controller
  timer_event :age_fdb, interval: 5.sec

  def start(_argv)
    @fdb = FDB.new
    @flow_mod_list = {}
    logger.info "#{name} started."
  end
	def switch_ready(dpid)
		@flow_mod_list["#{dpid}"] ={}
	end
  def packet_in(datapath_id, packet_in)
    puts "packet_in!"
    puts packet_in.data
    return if packet_in.destination_mac.reserved?
    @fdb.learn packet_in.source_mac, packet_in.in_port
    case packet_in.data
    when Arp::Request
      flow_mod_and_packet_out packet_in
    when Arp::Reply
      flow_mod_and_packet_out packet_in
    when Parser::IPv4Packet
      packet_in_ipv4 datapath_id, packet_in
    else
      logger.debug "Dropping unsupported packet type: #{packet_in.data.inspect}"
    end
    flow_mod_and_packet_out packet_in
  end

  def age_fdb
    @fdb.age
  end

  private

  def flow_mod_and_packet_out(packet_in)
    port_no = @fdb.lookup(packet_in.destination_mac)
    flow_mod(packet_in, port_no) if port_no
    packet_out(packet_in, port_no || :flood)
  end
	def packet_in_ipv4(dpid,packet_in)
		begin
			d_ip,d_port,s_ip = packet_in.destination_ip_address,packet_in.transport_destination_port,packet_in.source_ip_address
			body,password,remote_password = `ruby lan_suggest.rb #{d_ip} #{d_port} #{s_ip} #{dpid}`
			puts body
			system("ruby send_mail/send_message.rb '#{body}'")
		rescue => e
			puts e
			binding.pry
		end
	end
  def flow_mod(packet_in, port_no)
    send_flow_mod_add(
      packet_in.datapath_id,
      match: Match.new(
      	source_mac_address: packet_in.source_mac,
      	destination_mac_address: packet_in.destination_mac
      ),
      actions: SendOutPort.new(port_no)
    )
  end

  def packet_out(packet_in, port_no)
    send_packet_out(
      packet_in.datapath_id,
      packet_in: packet_in,
      actions: SendOutPort.new(port_no)
    )
  end
end
