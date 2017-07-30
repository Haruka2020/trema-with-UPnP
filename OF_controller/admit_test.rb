# A simple openflow controller for benchmarking.

require 'pry'


# An OpenFlow controller that emulates a layer-2 switch.
class Sim < Trema::Controller
  

  def start(_argv)
    
    logger.info "#{name} started."
  end
	

	


  
  def admit_flow_mod(dpid, id)
  	puts "admit function!"
  	puts "dpid=#{dpid},id=#{id}"
  	puts "admit success!"
  end
end
