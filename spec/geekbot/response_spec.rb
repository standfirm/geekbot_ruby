# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Geekbot::Response do
  let(:response_status) { 401 }

  let(:response_headers) do
    {
      'server' => 'nginx',
      'content-type' => 'text/html; charset=UTF-8'
    }
  end

  let(:response_body) do
    '{"error":"Unauthorized"}'
  end

  let(:faraday) do
    Faraday.new do |conn|
      conn.adapter :test, Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('/test') do
          [response_status, response_headers, response_body]
        end
      end
    end
  end

  subject(:response) do
    described_class.new(faraday.get('/test'))
  end

  describe '#body' do
    it do
      expect(response.body).to eq response_body
    end
  end

  describe '#headers' do
    let(:expectation) do
      {
        'Server' => 'nginx',
        'Content-Type' => 'text/html; charset=UTF-8'
      }
    end

    it do
      expect(response.headers).to eq expectation
    end
  end

  describe '#status' do
    it do
      expect(response.status).to eq response_status
    end
  end
end
