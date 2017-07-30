require 'fdb'
require 'pry'
require 'time' 
require 'benchmark'


# An OpenFlow controller that emulates a layer-2 switch.
class Sim < Trema::Controller

  timer_event :age_fdb, interval: 5.sec
  def start(_argv)
    @fdb = FDB.new
    @packet_stock = {}
    logger.info "#{name} started."
  end
  
  def switch_ready(datapath_id)
  	puts "switch ready"
  	@packet_stock[datapath_id] = {} unless @packet_stock[datapath_id]
    flood_mod_set(datapath_id)    
  end
  
  def packet_in(datapath_id, packet_in)
  	begin
    	return if packet_in.destination_mac.reserved?
    	@fdb.learn packet_in.source_mac, packet_in.in_port
    	case packet_in.data
    	when Parser::IPv4Packet
      	packet_in_ipv4(datapath_id,packet_in)
    	else
      	flow_mod_and_packet_out_ether(packet_in)
    	end
    rescue => e
    	puts e
    	binding.pry
    end    
  end

  def age_fdb
    @fdb.age
  end
  
  def admit_flow_mod(dpid, id)
  	begin
  		puts "admit function!"
  		puts "dpid=#{dpid},id=#{id}"
  		packet = @packet_stock[dpid][id]
  		puts packet.data
  		flow_mod_and_packet_out_ipv4(packet)
  		puts "admit success!"
  		time = Time.now
  		s = time.to_i
  		ms = time.usec
  		puts "now = #{s}.#{ms}"
  	rescue => e
  		put e
  		binding.pry
  	end
  end
	
	def packet_in_ipv4(datapath_id,packet_in)
		
		if(packet_in.destination_ip_address.to_s == '192.168.11.200' && packet_in.source_ip_address.to_s == '192.168.11.201')
			puts "test start"
			begin
				stop_packet(packet_in)
				d_ip,d_port,s_ip = packet_in.destination_ip_address,packet_in.transport_destination_port,packet_in.source_ip_address
				id = `ruby lan_suggest.rb 192.168.11.9 49152 #{s_ip} #{datapath_id}`.to_i
				@packet_stock[datapath_id][id] = packet_in				
			rescue => e
				puts e
			end
		else
			#flow_mod_and_packet_out_ipv4(packet_in)
		end		
	end
	
	def flow_mod_and_packet_out_ipv4(packet_in)
    port_no = @fdb.lookup(packet_in.destination_mac)
   	if(port_no && port_no > 0)
   		flow_mod_ipv4(packet_in, port_no) 
   		packet_out(packet_in, port_no)
   	else
   		flow_mod_ipv4(packet_in, 3) 
   		packet_out(packet_in, :flood)
    end
  end
	
  def flow_mod_and_packet_out_ether(packet_in)
    port_no = @fdb.lookup(packet_in.destination_mac)
  	if(port_no && port_no > 0)
   		ether_flow_mod(packet_in, port_no) 
   		packet_out(packet_in, port_no)
   	else
   		packet_out(packet_in, :flood)
   	end
  end

  def flow_mod_ipv4(packet_in, port_no)
    send_flow_mod_add(
      packet_in.datapath_id,
      match: Match.new(
      		ether_type: 0x0800,
      		ip_protocol: packet_in.ip_protocol,
      		destination_ip_address: packet_in.destination_ip_address,
      		transport_destination_port: packet_in.transport_destination_port,
      		source_ip_address: packet_in.source_ip_address,
      		priority: 5
      	),
      actions: SendOutPort.new(port_no)
    )
  end
  def ether_flow_mod(packet_in, port_no)
    send_flow_mod_add(
      packet_in.datapath_id,
      match: Match.new(
      	ether_type: packet_in.ether_type,
      	destination_mac_address: packet_in.destination_mac,
      ),
      actions: SendOutPort.new(port_no)
    )
  end
  def exact_flow_mod(packet_in, port_no)
    send_flow_mod_add(
      packet_in.datapath_id,
      match: ExactMatch.new(packet_in),
      actions: SendOutPort.new(port_no)
    )
  end
  
  def flood_mod_set(datapath_id)
    send_flow_mod_add(
      datapath_id,
      match: Match.new(
      		destination_mac_address: 'FF:FF:FF:FF:FF:FF',
      		ether_type: 0x0800,
      		ip_protocol: 17,
      		transport_source_port: 68,
      		transport_destination_port: 67,
      	),
      actions: SendOutPort.new(:flood)
    )
  end
   
  def packet_out(packet_in, port_no)
    send_packet_out(
      packet_in.datapath_id,
      packet_in: packet_in,
      actions: SendOutPort.new(port_no)
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

end
