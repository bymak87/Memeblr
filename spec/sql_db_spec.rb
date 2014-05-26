require 'spec_helper'

  describe 'SQLDB' do
    it 'exists' do
      expect(SQLDB).to be_a(Class)
    end
end
