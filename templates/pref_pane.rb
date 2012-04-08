meta :pref_pane do
  accepts_list_for :source
  accepts_list_for :extra_source
  accepts_list_for :provides

  def library_preference_panes_path
    "#{ENV['HOME']}/Library/PreferencePanes"
  end

  def pref_panes
    Dir["*.prefPane"]
  end

  template {
    prepare { setup_source_uris }
    met? {
      log_error 'provides needs to be specified' if provides.empty?
      !provides.collect do |file|
        File.exist?(file) ? log("Found #{file}") : false
      end.include?(false)
    }

    meet {
      process_sources { |archive|
        pref_panes.map do |entry|
          log_shell "Installing #{entry}", "cp -r '#{entry}' #{library_preference_panes_path}", :sudo => false
        end
      }
    }
  }
end