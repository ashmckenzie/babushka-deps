require 'pry'
require 'pry-nav'

class AshMcKenzieAppBundles

  def initialize
    self.class.apps.each do |app|
      dep app.keys.first do
        detail = app.values.first
        if detail.class == String
          source detail
        else
          source detail[:source]
          met? { detail[:met].call }
        end
      end
    end
  end

  def self.apps
    [
      { 'Dropbox.app' => 'http://cdn.dropbox.com/Dropbox%201.2.49.dmg' },
      { 'Google Chrome.app' => 'https://dl-ssl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg' },
      { 'Skitch.app' => 'http://get.skitch.com/skitch.zip' },
      { 'Skype.app' => 'http://download.skype.com/macosx/Skype_2.8.0.851.dmg' },
      { 'Transmit.app' => 'http://www.panic.com/transmit/d/Transmit 4.1.7.zip' },
      { 'Postbox.app' => 'http://download.getpostbox.com.s3.amazonaws.com/installers/3.0.3/1_8065a9cd330b254ee35833e92a319ef3a4b20d1e/postbox-3.0.3-mac64.dmg' },
      { 'Twitterrific.app' => 'http://iconfactory.com/assets/software/twitterrific/Twitterrific-4.4.8.zip' },
      { 'Sublime Text.app' => 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202%20Build%202190.dmg' },
      { 'iTerm.app' => 'http://iterm2.googlecode.com/files/iTerm2_v1_0_0.zip' },
      { '1Password.app' => 'https://d13itkw33a7sus.cloudfront.net/dist/1P/mac/1Password-3.8.18.zip' },
      { 'Alfred.app' => 'http://rwc.cachefly.net/alfred_1.1_189.dmg' },
      { 'Evernote.app' => 'http://www.evernote.com/about/download/get.php?file=EvernoteMac' },
      { 'Pixelmator.app' => 'http://pixelmator.s3.amazonaws.com/Pixelmator167.zip' },
      { 'SourceTree.app' => 'http://downloads.atlassian.com/software/sourcetree/SourceTree_1.3.3.dmg' },
      { 'iStat Menus.app' => 'http://s3.amazonaws.com/bjango/files/istatmenus3/istatmenus3.21.zip' },
      { 'Plex.app' => 'http://plex-downloads.s3.amazonaws.com/0.9.5.2/Plex-Media-Center-0.9.5.2.1.zip' },
      { 'Reggy.app' => 'http://github.com/downloads/samsouder/reggy/Reggy_v1.3.tbz' },
      { 'VLC.app' => 'http://downloads.sourceforge.net/project/vlc/2.0.1/macosx/vlc-2.0.1.dmg?r=http%3A%2F%2Fwww.videolan.org%2Fvlc%2Fdownload-macosx.html&ts=1333883394&use_mirror=aarnet' },
      { 'AppZapper.app' => 'http://www.appzapper.com/downloads/appzapper.dmg' },
      { 'Divvy.app' => 'http://mizage.com/downloads/Divvy.zip' },

      { 'MacRuby.installer' => 'http://www.macruby.org/files/MacRuby%200.10.zip' },

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
