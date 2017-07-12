#!/usr/bin/env ruby

#require 'rubygems'
#require 'bundler'
#Bundler.setup :default

require 'gli'
require 'trema'

# patch_panel command
module PatchPanelApp
  extend GLI::App

  desc 'Admit Flow_mod'
  arg_name 'dpid password'
  command :create do |c|
    c.desc 'Location to find socket files'
    c.flag [:S, :socket_dir], default_value: Trema::DEFAULT_SOCKET_DIR

    c.action do |_global_options, options, args|
      dpid = args[0].hex
      password = args[1].to_i
      
      Trema.trema_process('lswitch13', options[:socket_dir]).controller.
        admit_flow_mod(dpid, password)
    end
  end

  desc 'Cancel Flow_mod'
  arg_name 'dpid password'
  command :create do |c|
    c.desc 'Location to find socket files'
    c.flag [:S, :socket_dir], default_value: Trema::DEFAULT_SOCKET_DIR

    c.action do |_global_options, options, args|
      dpid = args[0].hex
      password = args[1].to_i
      
      Trema.trema_process('lswitch13', options[:socket_dir]).controller.
        cancel_flow_mod(dpid, password)
    end
  end

  exit run(ARGV)
end
