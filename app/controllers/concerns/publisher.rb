# frozen_string_literal: true

class Publisher # :nodoc:
  def self.publish(exchange, message = {})
    x = channel.fanout("gateway_api.#{exchange}")
    x.publish(message.to_json)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new.tap(&:start)
  end
end
