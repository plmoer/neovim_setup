#/bin/zsh

#The bash file is to install and configure neovim (nvim) for Mac with M1 chip
#Author: Linmin Pei
#Date: Nov. 23, 2021

#######install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

#######install neovim
brew install neovim

#######check git-completion.zsh exists
completionFILE=git-completion.zsh
if [[ -f "$completionFILE" ]]; then
    cp $completionFILE /Users/Shared
    echo "copy the file"
else
    echo "The $completionFILE File does not exist"
fi


#######check git-prompt exists
promptFILE=git-prompt.sh
if [[ -f "$promptFILE" ]]; then
    cp $promptFILE /Users/Shared
else
    echo "The $promptFILE File does not exist"
fi

#######check .bash_profile exists
bashFILE=.bash_profile
bash_root=~/.bash_profile
if [[ -f "$bash_root" ]]; then
   if [[ -f "$bashFILE" ]]; then
       cat $bashFILE >>  $bash_root
   else
       echo "$bashFILE does not exist"
   fi
else
   if [[ -f "$bashFILE" ]]; then
       cp $bashFILE ~
   else
       echo "$bashFILE does not exist"
   fi
fi


#######check .zshrc exists
zshrcFILE=.zshrc
zshrc_root=~/.zshrc
if [[ -f "$zshrc_root" ]]; then
   if [[ -f "$zshrcFILE" ]]; then
       cat $zshrcFILE >>  $zshrc_root
   else
       echo "$zshrcFILE does not exist"
   fi
else
   if [[ -f "$zshrcFILE" ]]; then
       cp $zshrcFILE ~
   else
       echo "$zshrcFILE does not exist"
   fi
fi


#######check nvim folder exists
nvimDir=~/.config/nvim
if [[ -d "$nvimDir" ]]; then
    mkdir -p $nvimDir
    echo "Make the $nvimDir"
else
    echo "$nvimDir does not exist"
fi


#######check autoload folder exists
autoloadDir=~/.config/nvim/autoload
if [[ -d "$autoloadDir" ]]; then
    mkdir -p $autoloadDir
    echo "Make the $autoloadDir"
else
    echo "$autoloadDir does not exist"
fi
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o $autoloadDir/plug.vim


#######check init.vim exists
initFILE=init.vim
if [[ -f "$initFILE" ]]; then
    cp $initFILE $nvimDir
else
    echo "$initFILE does not exist"
fi
