# Filebot as Daemon

Ever wanted to have Filebot watch a directory in the background? Now you can.

## Setup

Clone this repo

```
git clone https://github.com/yestradamus/filebot-daemon ~/Applications/filebot-daemon
cd filebot-daemon
```

Install brew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install filebot

```
brew install caskroom/cask/brew-cask
brew cask install java
brew cask install filebot
```

Install fswatch

```
brew install fswatch
```

Open `init.osx` and change this if necessary

```
<string>~/Applications/filebot-daemon/watch.sh</string>
```

Open `watch.sh` and change all the paths

1. `which fswatch` will give location of fswatch
2. `which filebot` will give location of filebot
3. `--output "/path/to/plex/root"` should be the path to the root of your plex direction
4. `"/path/to/inbox"` should be the path to the directory to watch and copy files from
5. `/path/to/plex/root/amc.log` should be a writeable log. I suggest the root of your plex directory

Ensure `watch.sh` is executable

```
chmod +x watch.sh
```

Copy `init.osx` to LaunchAgents directory

```
cp init.osx ~/Library/LaunchAgents/io.github.yestradamus.filebot-daemon.plist
```

Change permissions

```
sudo chmod 600 ~/Library/LaunchAgents/io.github.yestradamus.filebot-daemon.plist
sudo chown root ~/Library/LaunchAgents/io.github.yestradamus.filebot-daemon.plist
```

Launch the daemon (it will launch on restart from now on)

```
launchctl load ~/Library/LaunchAgents/io.github.yestradamus.filebot-daemon.plist
```

Now you're good to go

## Troubleshooting

To monitor launching the daemon, tail the system logs

```
tail -f /var/log/system.log
```

To monitor filebot, tail the filebot logs

```
tail -f /path/to/plex/root/amc.log
```
