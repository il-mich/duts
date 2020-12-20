# Set editors
export EDITOR=nvim
export VISUAL=nvim-qt

# Add pages to man
export MANPATH=/usr/local/share/man:/usr/share/man:$MANPATH

# Set XDG_RUNTIME_DIR
if [[ -z "${XDG_RUNTIME_DIR}" ]]
then
	export XDG_RUNTIME_DIR=/tmp/runtime-$USER
fi

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/default

# Neverlang shits
export NEVERLANG_HOME=$HOME/.local/lib/neverlang2-1.2

# add stuff to PATH
export PATH=$NEVERLANG_HOME/bin:$JAVA_HOME/bin:$HOME/.local/bin:$PATH

# start session
#startx
