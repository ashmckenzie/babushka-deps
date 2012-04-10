dep 'htop.managed' do
  meet {
    pkg_manager.install! packages, '--HEAD'
  }
end