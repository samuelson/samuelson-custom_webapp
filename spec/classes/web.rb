require 'spec_helper'

describe 'Set up custom_webapp reverse proxy' do
  let(:facts) { {
    :fqdn => 'app.puppet.vm'
  }
  it { should compile }
end
