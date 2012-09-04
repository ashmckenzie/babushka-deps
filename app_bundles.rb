class AshMcKenzieAppBundles

  def initialize
    self.class.apps.each do |app|
      dep app.keys.first do
        begin
          detail = app.values.first
          if detail.class == String
            source detail
          else
            source detail[:source]
            met? { detail[:met].call }
          end
        rescue => e
          puts "An exception occurred - '#{e.insect}'"
        end        
      end
    end
  end

  def self.apps
    [
      { 'Dropbox.app' => 'http://cdn.dropbox.com/Dropbox%201.2.49.dmg' },
      { 'Google Chrome.app' => 'https://dl-ssl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg' },
      { 'Skype.app' => 'http://download.skype.com/macosx/Skype_5.8.0.1027.dmg' },
      { 'Transmit.app' => 'http://www.panic.com/transmit/d/Transmit 4.1.7.zip' },
      { 'Sublime Text.app' => 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202%20Build%202216.dmg' },
      { 'iTerm.app' => 'http://iterm2.googlecode.com/files/iTerm2_v1_0_0.zip' },
      { '1Password.app' => 'https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.18.zip' },
      { 'Alfred.app' => 'http://rwc.cachefly.net/alfred_1.3.1_261.dmg' },
      { 'Evernote.app' => 'http://www.evernote.com/about/download/get.php?file=EvernoteMac' },
      { 'SourceTree.app' => 'http://downloads.atlassian.com/software/sourcetree/SourceTree_1.5.3.dmg' },
      { 'iStat Menus.app' => 'http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.21.zip' },
      { 'Plex.app' => 'http://plex-downloads.s3.amazonaws.com/plex-laika/0.9.5.4/Plex-0.9.5.4-973998f.zip' },
      { 'Reggy.app' => 'http://github.com/downloads/samsouder/reggy/Reggy_v1.3.tbz' },
      { 'VLC.app' => 'http://downloads.sourceforge.net/project/vlc/2.0.1/macosx/vlc-2.0.1.dmg?r=http%3A%2F%2Fwww.videolan.org%2Fvlc%2Fdownload-macosx.html&ts=1333883394&use_mirror=aarnet' },
      { 'AppZapper.app' => 'http://www.appzapper.com/downloads/appzapper.dmg' },
      { 'Divvy.app' => 'http://mizage.com/downloads/Divvy.zip' },
      { 'Adium.app' => 'http://download.adium.im/Adium_1.5.3.dmg' },
      { 'Trillian.app' => 'http://cerulean.cachenetworks.com/trillian-for-mac-v1.3.0.37.zip' },
      { 'TextMate.app' => 'http://download.macromates.com/TextMate_1.5.11_r1635.zip' },
      { 'A Better Finder Rename.app' => 'http://www.publicspace.net/download/ABFRX9.dmg' },
      { 'Pref Setter.app' => 'http://www.nightproductions.net/downloads/prefsetter.zip' },
      { 'CheatSheet.app' => 'http://www.cheatsheetapp.com/CheatSheet/download.php' },
      { 'Firefox.app' => 'http://download.mozilla.org/?product=firefox-15.0&os=osx&lang=en-GB' },

      {
        'TotalFinder.installer' => {
          :source =>'http://downloads.binaryage.com/TotalFinder-1.3.2.dmg',
          :met => lambda { '/Applications/TotalFinder.app'.p.exist? }
        }
      }
    ]
  end
end

AshMcKenzieAppBundles.new
