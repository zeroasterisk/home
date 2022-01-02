
PATH=$HOME/bin:$PATH
PATH=/usr/bin/local:/usr/local/bin:$PATH
PATH=/usr/local/pgsql/bin:/usr/local/php5/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH
PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
PATH=$PATH:$HOME/opt/vert.x-2.1.1/bin
#PATH=$PATH:/opt/local/heroku/bin
PATH=$PATH:/opt/local/lib/percona/bin
#PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$HOME/.composer/vendor/bin
PATH=/opt/local/lib/percona/bin:$PATH
PATH=/usr/local/git/bin:$PATH

# PATH CLEAUP
# There's something funky as hell in the PATH before it gets to .zshenv (etc)
# /bin:/sbin:Vim�UnDo�:/usr/local/git/bin:
# so this will remove it
PATH=`echo $PATH | LANG=C sed -e 's/Vim[^\x00-\x7F]UnDo[^\x00-\x7F]://'`

# Export the PATH
export PATH=$PATH

MANPATH="/opt/local/share/man:$MANPATH"
