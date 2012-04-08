dep 'ash-macbook-air' do
  AshMcKenzieAppBundles.apps.each do |app|
    requires app.keys.first
  end
  requires 'Perian.pref_pane'
end