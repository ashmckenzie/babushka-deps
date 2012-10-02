dep 'ash-macbook-air' do
  AshMcKenzieAppBundles.apps.each { |app| requires app.keys.first }
  requires 'Perian.pref_pane'
  requires 'brew_packages'
  requires 'npm_packages'
end
