module Wonga
  module Daemon
    class PantryEc2StoppedEventHandler
      def initialize(api_client, logger)
        @logger = logger
        @api_client = api_client
      end

      def handle_message(message)
        @logger.info "Returning stopped event for Request:#{message['id']}, Name:#{message['instance_name']}"
        @api_client.send_put_request("/api/ec2_instances/#{message['id']}", { "event" => "shutdown" })
        @logger.info "Returned stopped event for Request:#{message['id']}, Name:#{message['instance_name']} succeeded"
      end
    end
  end
end
