# frozen_string_literal: true

require 'spec_helper'

describe 'maven' do
  describe 'without any parameters' do
    it { is_expected.to compile.with_all_deps }

    it do
      is_expected.to contain_file('/opt/maven').with(
        ensure: 'directory',
        owner: 'root',
        group: 'root',
        mode: '0755',
      )
    end

    it do
      is_expected.to contain_file('/opt/maven/apache-maven-3.6.3').with(
        ensure: 'directory',
        owner: 'root',
        group: 'root',
        mode: '0755',
      )
    end

    it do
      is_expected.to contain_file('/etc/profile.d/maven.sh').with(
        ensure: 'file',
        owner: 'root',
        group: 'root',
        mode: '0644',
        content: "export PATH=/opt/maven/apache-maven-3.6.3/bin:${PATH}\n",
      )
    end

    it do
      is_expected.to contain_archive('/tmp/apache-maven-3.6.3-bin.tar.gz').with(
        ensure: 'present',
        extract: true,
        extract_path: '/opt/maven',
        source: 'https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz',
        creates: '/opt/maven/apache-maven-3.6.3',
        cleanup: true,
      )
    end
  end
end
