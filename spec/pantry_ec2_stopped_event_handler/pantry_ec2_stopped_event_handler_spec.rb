require 'spec_helper'
require_relative '../../pantry_ec2_stopped_event_handler/pantry_ec2_stopped_event_handler'

describe Wonga::Daemon::PantryEc2StoppedEventHandler do
  let(:config) {
    {
      "pantry" => {
        "api_key" => "some_api_key",
        "request_timeout" => 10,
        "url" => "http://some.url"
      }
    }
  }
  let(:logger) { instance_double('Logger').as_null_object }

  subject { Wonga::Daemon::PantryEc2StoppedEventHandler.new(config, logger) }

  it_behaves_like 'handler'
end