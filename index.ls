backbone = require 'backbone4000'
Mqtt = require 'mqtt'

exports.lego = backbone.Model.extend4000 do
  after: [ 'logger' ]
  init: (callback) ->
    mqtt = @env.mqtt = @mqtt = new Mqtt.connect @settings.host
    mqtt.on 'connect', ~> 
      @env.l && @env.log 'mqtt connected to ' + @settings.host
      callback()
