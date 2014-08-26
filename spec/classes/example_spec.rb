require 'spec_helper'

describe 'tinc' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "tinc class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('tinc::params') }
        it { should contain_class('tinc::install').that_comes_before('tinc::config') }
        it { should contain_class('tinc::config') }
        it { should contain_class('tinc::service').that_subscribes_to('tinc::config') }

        it { should contain_service('tinc') }
        it { should contain_package('tinc').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'tinc class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('tinc') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
