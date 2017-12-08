require 'spec_helper'
require 'faraday'
require 'geekbot/client/v1'

RSpec.describe Geekbot::Client::V1 do
  let(:client) { described_class.new(connection) }
  let(:connection) do
    Faraday.new do |builder|
      builder.adapter :test do |stub|
        user = { id: 'A0', email: 'test@example.com', realname: 'Test' }
        stub.get('/v1/teams/') { |env| [200, {}, { id: 1, name: 'Test', users:[user] }]}
        stub.get('/v1/reports/') { |env| [200, {}, [{ id: 1, slack_ts: '1.2', standup_id: 1, timestamp: 1, member: user, channel: 'general', questions: [{ id: 1, question: 'How are you?', images: [] }] }]] }
        standup = { id: 1, name: 'A Standup', time: '10:00:00', wait_time: 0 }
        stub.get('/v1/standups/') { |env| [200, {}, [standup]] }
        stub.get('/v1/standups/1') { |env| [200, {}, standup] }
      end
    end
  end

  describe '#teams' do
    subject { client.teams }

    it { is_expected.to be_a(Geekbot::Team) }
  end

  describe '#reports' do
    subject { client.reports }

    it { is_expected.to contain_exactly(be_a(Geekbot::Report)) }
  end

  describe '#standups' do
    subject { client.standups }

    it { is_expected.to contain_exactly(be_a(Geekbot::Standup)) }
  end

  describe '#standup' do
    subject { client.standup(1) }

    it { is_expected.to be_a(Geekbot::Standup) }
  end
end
