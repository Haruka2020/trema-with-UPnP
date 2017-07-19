# A simple openflow controller for benchmarking.
require 'pry'
class Sim < Trema::Controller
  def start(_args)
    logger.info "#{name} started."
    @packet_stock = {}
  end
	def switch_ready(dpid)
		puts "#{dpid} switch  start"
		@packet_stock[dpid] = {} unless @packet_stock[dpid]
	end
  def packet_in(datapath_id, packet_in)
    case packet_in.data
    when Arp::Request
      flow_mod(packet_in)
    when Arp::Reply
      flow_mod(packet_in)
    when Parser::IPv4Packet
      packet_in_ipv4(datapath_id,packet_in)
    else
      logger.debug "Dropping unsupported packet type: #{packet_in.data.inspect}"
    end
  end
  def packet_in_ipv4(dpid,packet_in)
  	puts "ipv4 destination #{packet_in.destination_ip_address.to_s}"
		
		if(packet_in.destination_ip_address.to_s == '192.168.11.11')
			puts "test start"
			begin
				stop_packet(packet_in)
				d_ip,d_port,s_ip = packet_in.destination_ip_address,packet_in.transport_destination_port,packet_in.source_ip_address
				id = `ruby lan_suggest.rb 192.168.11.9 49152 #{s_ip} #{dpid}`.to_i
				@packet_stock[dpid][id] = packet_in
				
			rescue => e
				puts e
				binding.pry
			end
		else
			ipv4_flow_mod(packet_in)
		end
	end
	
  def ipv4_flow_mod(packet_in,priority=1)
  	out_port = 2
  	if(packet_in.in_port==4)
  		out_port = 5
    else
    	out_port = 4
    end
    begin
    	send_flow_mod_add(
      	packet_in.datapath_id,
      	match: Match.new(
      		source_mac_address: packet_in.source_mac,
      		ether_type: packet_in.ether_type,
      		priority: priority,
      		destination_ip_address: packet_in.destination_ip_address
      	),
     		actions: SendOutPort.new(out_port)
    	)	
    	packet_out(packet_in,out_port)
    rescue => e
    	binding.pry
    end
  end
  
  def flow_mod(packet_in,priority=1)
  	out_port = 2
  	if(packet_in.in_port==4)
  		out_port = 5
    else
    	out_port = 4
    end
    begin
    send_flow_mod_add(
      packet_in.datapath_id,
      match: Match.new(
      	source_mac_address: packet_in.source_mac,
      	ether_type: packet_in.ether_type,
      	protocol_type: packet_in.protocol_type,
      	priority: priority
      ),
     	actions: SendOutPort.new(out_port)
    )	
    packet_out(packet_in,out_port)
    rescue => e
    	binding.pry
    end
  end
  
  def stop_packet(packet_in)
    send_flow_mod_add(
      packet_in.datapath_id,
      match: Match.new(
      	source_mac_address: packet_in.source_mac,
      	ether_type: packet_in.ether_type,
      	destination_ip_address: packet_in.destination_ip_address,
      	priority: 2
      )
    )	
  end
  def stop_packet(packet_in)
    send_flow_mod_add(
      packet_in.datapath_id,
      match: Match.new(
      	source_mac_address: packet_in.source_mac,
      	ether_type: packet_in.ether_type,
      	destination_ip_address: packet_in.destination_ip_address,
      	priority: 2
      )
    )	
  end
  
	def packet_out(packet_in, port_no)
    send_packet_out(
      packet_in.datapath_id,
      packet_in: packet_in,
      actions: SendOutPort.new(port_no)
    )
  end
  def admit_flow_mod(dpid, id)
  	puts "admit function!"
  	puts "dpid=#{dpid},id=#{id}"
  	packet = @packet_stock[dpid][id]
  	ipv4_flow_mod(packet,4)
  	puts "admit success!"
  	binding.pry
  end
end
