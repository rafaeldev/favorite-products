# frozen_string_literal: true

require 'rails_helper'

describe JsonWebToken do
  subject(:service) { described_class }

  let!(:secret_key) { Rails.application.secrets.secret_key_base }

  describe '.encode' do
    context 'when call encode method' do
      before do
        allow(JWT).to receive(:encode).and_return(:ok)
      end

      it 'encondes payload passed' do
        expect(service.encode(dummy: 'miss')).to eq :ok
      end
    end
  end

  describe '.decode' do
    context 'when token is found' do
      before do
        allow(JWT).to receive(:decode).with('token', secret_key).and_return([key: :ok])
      end

      it 'returns decoded token' do
        expect(service.decode('token')).to eq 'key' => :ok
      end
    end

    context 'when raise an error' do
      it 'returns nil value' do
        expect(service.decode(nil)).to be_nil
      end
    end
  end
end
