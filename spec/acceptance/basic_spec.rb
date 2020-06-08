# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'maven class' do
  context 'without params' do
    let(:pp) do
      <<-EOS
      class{ 'maven': }
      EOS
    end

    it_behaves_like 'an idempotent resource'

    %w[
      /opt/maven
      /opt/maven/apache-maven-3.6.3
      /opt/maven/apache-maven-3.6.3/bin
    ].each do |f|
      describe file(f) do
        it { is_expected.to be_directory }
        it { is_expected.to be_owned_by 'root' }
        it { is_expected.to be_grouped_into 'root' }
        it { is_expected.to be_mode '755' } # serverspec does not like a leading 0
      end
    end

    describe file('/etc/profile.d/maven.sh') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode '644' } # serverspec does not like a leading 0
      its(:content) { is_expected.to match "export PATH=/opt/maven/apache-maven-3.6.3/bin:${PATH}\n" }
    end
  end
end
