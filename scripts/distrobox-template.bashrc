# Distrobox container bashrc template

# Source ROS setup
source /opt/ros/"<<<ROS_DISTRO_TEMPLATE_SUBSTITUTION>>>"/setup.bash

# Get the workspace directory (parent of scripts dir where this is copied from)
WORKSPACE_DIR="$(cd "$HOME/.." && pwd)"

# Source workspace if it exists
if [ -f "$WORKSPACE_DIR/install/setup.bash" ]; then
    source "$WORKSPACE_DIR/install/setup.bash"
fi

# Standard bash configuration
export PS1='\[\033[01;32m\]\u@distrobox\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Enable color support
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ROS aliases
alias cb='cd $WORKSPACE_DIR && colcon build'
alias cbs='cd $WORKSPACE_DIR && colcon build --symlink-install'
alias ct='cd $WORKSPACE_DIR && colcon test'
alias cclean='cd $WORKSPACE_DIR && rm -rf build install log'

# Function to rebuild from anywhere
rebuild() {
    local current_dir=$(pwd)
    cd "$WORKSPACE_DIR"
    colcon build "$@"
    cd "$current_dir"
}
