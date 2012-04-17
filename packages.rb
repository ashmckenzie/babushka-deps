dep 'htop.managed' do
  meet {
    pkg_manager.install! packages, '--HEAD'
  }
end

home_brew_pkgs = %w(
  coreutils
  gnu-sed 
  pstree 
  redis 
  imagemagick 
  ack 
  multitail 
  wget 
  wkhtmltopdf 
  pwgen 
  node
  rsync
)

home_brew_pkgs.each do |pkg|
  dep "#{pkg}.managed" do
    met? {
      `brew list | grep -c #{pkg}`.chomp.to_i == 0 ? false : true
    }
  end
end

dep 'packages' do
  requires 'htop.managed'
  home_brew_pkgs.each { |pkg| requires "#{pkg}.managed" }
end