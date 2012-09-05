home_brew_pkgs = %w(
  coreutils
  gnu-sed
  pstree
  redis
  imagemagick
  ack
  multitail
  wget
  pwgen
  node
  rsync
  ssh-copy-id
  htop-osx
  postgresql
  pngcrush
  nginx
  mongodb
  elinks
  nmap
  phantomjs
  pstree
  unrar
)

home_brew_pkgs.each do |pkg|
  dep "#{pkg}.managed" do
    met? {
      `brew list | grep -c #{pkg}`.chomp.to_i == 0 ? false : true
    }
  end
end

dep 'packages' do
  home_brew_pkgs.each { |pkg| requires "#{pkg}.managed" }
end

system('rehash')
