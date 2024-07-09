abbr -a brewup 'brew update && brew upgrade && brew doctor'
abbr -a school 'cd ~/my-docs/school/currsem'
abbr -a develop 'cd ~/dev'
abbr -a colortest 'curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash'
abbr -a configdir 'cd ~/.config'
abbr -a nv 'nvim'
abbr -a vim 'nvim'

if command -v exa > /dev/null
  abbr -a l 'exa -a'
  abbr -a ll 'exa -la --grid --icons'
else
  abbr -a l 'ls'
  abbr -a ll 'ls -l'
  abbr -a lll 'ls -la'
end


function fish_greeting
  # neofetch --ascii ~/.config/neofetch/welcome_art.ascii
  echo "GET OUT OF MY HEAD GET OUT OF MY HEAD GET OUT OF MY HEAD GET OUT OF MY HEAD GET OUT OF MY HEAD GET OUT OF MY HEAD "
end


set -x GOPATH "/Users/toast/dev/go"
set -x GOBIN "$GOPATH/bin"


if status is-interactive
  # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"

set -gx PATH "$VOLTA_HOME/bin:/Library/TeX/texbin:$HOME/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:/opt/X11/bin:$HOME/.dotnet/tools:/Library/Apple/usr/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/usr/local/opt/fzf/bin:usr/local/go/bin:$GOBIN:/Users/toast/bin"
