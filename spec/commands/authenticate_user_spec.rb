# frozen_string_literal: true

require 'rails_helper'

describe AuthenticateUser do
  subject(:command) { described_class.call(username, password) }

  let!(:password) { 'password' }

  before { create :client, email: 'derp@email.com', password: password, password_confirmation: password }

  describe '.call' do
    context 'when the context is successful' do
      let(:username) { 'derp@email.com' }
      let(:password) { 'password' }

      it 'succeeds' do
        expect(command).to be_success
      end
    end

    context 'when the context is not successful' do
      let(:username) { 'wrong_email' }
      let(:password) { 'wrong_password' }

      it 'fails' do
        expect(command).to be_failure
      end
    end
  end
end
