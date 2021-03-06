require 'spec_helper'

describe 'pdagent' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "pdagent class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_package('pdagent').with_ensure('present') }
          it { is_expected.to contain_package('pdagent-integrations').with_ensure('present') }

        end
      end
    end
  end
end
