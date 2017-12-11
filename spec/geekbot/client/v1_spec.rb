require 'spec_helper'
require 'faraday'
require 'geekbot/client/v1'

RSpec.describe Geekbot::Client::V1 do
  let(:client) { described_class.new(connection) }
  let(:param) { { id: 1, name: 'A Standup', time: '10:00:00', wait_time: 0 } }
  let(:connection) do
    Faraday.new do |builder|
      builder.adapter :test do |stub|
        user = { id: 'A0', email: 'test@example.com', realname: 'Test' }

        stub.get('/v1/teams/') do |_env|
          [200, {}, { id: 1, name: 'Test', users: [user] }]
        end

        stub.get('/v1/reports/') do |_env|
          [200, {}, [{ id: 1, slack_ts: '1.2', standup_id: 1, timestamp: 1, member: user, channel: 'general', questions: [{ id: 1, question: 'How are you?', images: [] }] }]]
        end

        standup = { id: 1, name: 'A Standup', time: '10:00:00', wait_time: 0 }

        stub.get('/v1/standups/') do |_env|
          [200, {}, [standup]]
        end

        stub.get('/v1/standups/1') do |_env|
          [200, {}, standup]
        end

        stub.post('/v1/standups') do |_env|
          [200, {}, standup]
        end

        stub.patch('/v1/standups/1', standup) do |_env|
          [200, {}, standup]
        end

        stub.put('/v1/standups/1', standup) do |_env|
          [200, {}, standup]
        end

        stub.delete('/v1/standups/1') do |_env|
          [200, {}, standup]
        end
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
    subject { client.standup(id: 1) }

    it { is_expected.to be_a(Geekbot::Standup) }
  end

  describe '#create_standup' do
    subject { client.create_standup(params: param) }

    it { is_expected.to be_a(Geekbot::Standup) }
  end

  describe '#update_standup' do
    subject { client.update_standup(id: 1, params: param) }

    it { is_expected.to be_a(Geekbot::Standup) }
  end

  describe '#replace_standup' do
    subject { client.replace_standup(id: 1, params: param) }

    it { is_expected.to be_a(Geekbot::Standup) }
  end

  describe '#destroy_standup' do
    subject { client.destroy_standup(id: 1) }

    it { is_expected.to be_a(Geekbot::Standup) }
  end
end
