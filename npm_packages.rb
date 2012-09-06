dep 'npm_packages' do
  install_npm_package 'coffee-script'
  install_npm_package 'express'
end

def install_npm_package package
  system("npm install -g #{package}") unless npm_package_installed?(package)
end

def npm_package_installed? package
  %x{ npm list -g #{package} | grep empty | wc -l }.strip == '0'
end
