require 'spec_helper'

describe 'Set up custom_webapp database' do
  let(:facts) { {
     :fqdn => 'app.puppet.vm'
  }
  it { should compile }
end
