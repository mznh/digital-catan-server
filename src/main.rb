#!/usr/bin/env ruby

require "bundler/setup"
Bundler.require
require 'json'
require 'pp'
require 'thread'
require_relative "./game_master"



game_master = GameMaster.new()
 
loop do
  game_master.work
  if game_master.work_completed? then
    break
  end
end




#Thread.new do
#  p "send start"
#  client = Faye::WebSocket::Client.new('ws://localhost:8888')
#  client.send(hash_data.to_json)
#  p "send end"
#  ## 暫く待つ
#  sleep(0.5)
#  client.close()
#end




