require 'spec_helper'

describe 'syncengine' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "syncengine class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('syncengine::params') }
          it { is_expected.to contain_class('syncengine::install').that_comes_before('syncengine::config') }
          it { is_expected.to contain_class('syncengine::config') }
          it { is_expected.to contain_class('syncengine::service').that_subscribes_to('syncengine::config') }

          it { is_expected.to contain_service('syncengine') }
          it { is_expected.to contain_package('syncengine').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'syncengine class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('syncengine') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
