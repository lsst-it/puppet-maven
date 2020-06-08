# @summary
#   Install Maven
#
# @param version
#   String giving version to install.
# @param dest
#   String giving directory to install to (parent must exist).
#
class maven (
  String                    $version   = '3.6.3',
  Stdlib::Absolutepath      $base_path = '/opt/maven',
  Optional[Stdlib::HTTPUrl] $url       = undef,
) {

  $slug       = "apache-maven-${version}"
  $tar_file   = "${slug}-bin.tar.gz"
  $unpack_dir = "${base_path}/apache-maven-${version}"

  $_real_url = $url ? {
    undef   => "https://archive.apache.org/dist/maven/maven-3/${version}/binaries/${tar_file}",
    default => $url,
  }

  ensure_resources('file', {
    $base_path  => {
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      purge   => true, # rm any other version
      force   => true,
      recurse => true,
      backup  => false,
    },
  })

  archive { "/tmp/${tar_file}":
    ensure       => present,
    extract      => true,
    extract_path => $base_path,
    source       => $_real_url,
    creates      => $unpack_dir,
    cleanup      => true,
  }

  file { $unpack_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    backup  => false,
    require => Archive["/tmp/${tar_file}"],
  }

  file { '/etc/profile.d/maven.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "export PATH=${unpack_dir}/bin:\${PATH}\n",
  }
}
