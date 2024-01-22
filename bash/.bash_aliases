# standard alias for list direcotories
alias ll="ls -la"
alias la="ls -l"
alias l="ls"

# alias for nvim
alias vim=nvim

# spotify-adblock
alias adspotify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"

# fot rhe meme
alias poweroof=poweroff

# go to ComputerGraphics
alias cg="cd ~/Documents/ComputerGraphics/"
alias cg2="cd ~/Documents/ComputerGraphics/CG-Project2/"

# go to tecnologieWeb
alias tw="cd ~/Documents/TecnologieWeb/"

# go to HighPerformanceCompunting
alias hpc="cd ~/Documents/HighPerformance/"

# go to arch-config repo
alias arconf="cd ~/Documents/arch-config/"

# connect to isi-raptor server from inside almawifi
alias inraptor="ssh davide.marchetti6\@studio.unibo.it@isi-raptor03.csr.unibo.it"

# connect to isi-raptor server from outside almawifi
alias outraptor="ssh raptor"


# start xampp docker image
alias twstart="sudo docker container start myXampp"

# stop xampp docker image
alias twstop="sudo docker container stop myXampp"

# starts docker service
alias dkstart="sudo systemctl start docker"

# stop docker service
alias dkstop="twstop ; sudo systemctl stop docker.socket"

# pacman update
alias pac-update="sudo pacman -Syu ; echo \"--- Pacman packages updated ---\""

# yay update
alias yay-update="yay -Syu ; echo \"--- Yay packages updated ---\""

# full system update
alias full-update="sudo pacman -Syu ; yay -Syu ; echo \"--- Full system update completed ---\""

# funny
# alias porcodio="echo BRAVO"
