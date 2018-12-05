# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Geekbot::Client do
  let(:access_token) { nil }

  subject(:client) do
    described_class.new(access_token: access_token)
  end

  %i[get post put patch delete].each do |method|
    describe "##{method}" do
      let(:path) { 'path/to/path' }
      let(:params) { 'params' }
      let(:headers) { 'headers' }

      it do
        expect(subject).to receive(:request).with(method, path, params, headers)
        client.send(method, path, params, headers)
      end
    end
  end
end
