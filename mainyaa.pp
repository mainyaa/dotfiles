class people::mainyaa {
  include osx::global::enable_keyboard_control_access

  class { 'osx::global::key_repeat_delay':
    delay => 10
  }
  class { 'osx::global::key_repeat_rate':
    rate => 2
  }
  #includes
  include ohmyzsh
  include wget
  include ctags
  include java
  include skype
  include iterm2::stable
  include chrome
  include firefox
  include virtualbox
  include vagrant
  include mou
  include android
  include flux
  include rubymine
  include sourcetree
  include dropbox
  include sublime_text_2
  include inkscape
  include eclipse
  include libreoffice
  include groovy
  include go
  include nodejs
  include nvm
  include google-app-engine
  include google_app_engine::python
  include better_touch_tools

  class { 'intellij':
    edition => 'ultimate',
  }
  #include osx

  
  # homebrew でインストールするもの
  package {
    [
      'tmux',
      'reattach-to-user-namespace',
      'tree',
      'pidof',
      'ctags',
      'gdbm',
      'maven',
      'pcre',
      'direnv',
      'grunt',
      'python',
      'pythonbrew',
      'spark',
      'trash',
      'yuicompressor',
      'git',
      'gibo',
      'ag',
      'node',
      'phantomjs',
      'readline',
      'spidermonkey',
      'z',
      'ibevent',
      'nspr',
      'pkg-config',
      'sbt',
      'sqlite',
      'watch',
      'libtool',
      'oniguruma',
      'protobuf',
      'scala',
      'tig',
      'wget',
      'llvm',
      'optipng',
      'pstree',
      'serf',
      'zsh-completions',
      'xz'
    ]:
  }

  package {
    'ForkLift':
      source   => "http://download.binarynights.com/ForkLift2.5.4.zip",
      provider => compressed_app;
    'Mou':
      source   => "http://mouapp.com/download/Mou.zip",
      provider => compressed_app;
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'RemoteDesktopConnectionClient':
      source => "http://download.microsoft.com/download/C/F/0/CF0AE39A-3307-4D39-9D50-58E699C91B2F/RDC_2.1.1_ALL.dmg",
      provider => pkgdmg;
    'MacVimKaoriYa':
      source => "https://macvim-kaoriya.googlecode.com/files/macvim-kaoriya-20130911.dmg",
      provider => appdmg;
    'GoogleDrive':
      source => "https://dl.google.com/drive/installgoogledrive.dmg",
      provider => appdmg;
    'MacFUSE':
      source => "https://macfuse.googlecode.com/files/MacFUSE-2.0.3%2C2.dmg",
      provider => pkgdmg;
    'PortHole':
      source => "http://www.getporthole.com/downloads/trial",
      provider => pkgdmg;
    'Synergy':
      source => "http://synergy-foss.org/download/?file=synergy-1.4.12-MacOSX108-x86_64.dmg",
      provider => appdmg;
  }

  package {
    'zsh':
      install_options => [
        '--disable-etcdir'
      ]
  }
  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
    before  => Osx_chsh[$::luser];
  }
  osx_chsh { $::luser:
    shell   => "${boxen::config::homebrewdir}/bin/zsh";
  }

  $home     = "/Users/${::luser}"
  $src      = "${home}/src"
  $dotfiles = "${src}/dotfiles"
  $home_local   = "${home}/local"
  $home_bin     = "${home}/bin"
  $dust_vim_backup   = "${home}/txtb"
  file {$dust:
    ensure => directory
  }
  file {$dust_vim:
    ensure => directory
  }
  file {$home_local:
    ensure => directory
  }
  file {$home_bin:
    ensure => directory
  }
  file {$dust_vim_backup:
    ensure => directory
  }



  # git clone git@github.com:mainyaa/dotfiles.git
  repository { $dotfiles:
    source  => "mainyaa/dotfiles",
    require => File[$src]
  }

  # git-cloneしたら install.sh を走らせる
  exec { "sh ${dotfiles}/install.sh":
    cwd => $dotfiles,
    creates => "${home}/.zshrc",
    require => Repository[$dotfiles],
  }

}
