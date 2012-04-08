dep 'ash-macbook-air' do
  apps.each do |app|
    requires app
  end
  requires 'Perian.pref_pane'
end