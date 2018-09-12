require 'spec_helper'

describe 'facts_test' do
  let(:node) { 'foobar.example.com' }
  let(:params) { {} }

  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)
  # This will need to get moved
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      it { pp catalogue.resources }

      describe 'check default config' do
        it { is_expected.to compile.with_all_deps }
        it do
          is_expected.to contain_file('/tmp/hiera_ipaddress').with(
            ensure: 'file',
            content: '172.16.254.254',
          )
        end
        it do
          is_expected.to contain_file('/tmp/facts_ipaddress').with(
            ensure: 'file',
            content: '172.16.254.254',
          )
        end
        it do
          is_expected.to contain_file('/tmp/ipaddress').with(
            ensure: 'file',
            content: '172.16.254.254',
          )
        end
      end
    end
  end
end
