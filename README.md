# My dotfiles

## Inspirations

* [Jake Wiesler's Blog Post](https://www.jakewiesler.com/blog/managing-dotfiles)
* [Elliott Minns's Youtube Video](https://youtube.com/watch?v=y6XCebnB9gs)

## Requirements

* Stow

## Configurations stored in this repository

* zsh
* tmux

## Cretate dotfiles from github repository

Clone the git repository:

    $ git clone git@github.com:mimosinnet/.dotfiles.git

Change to the dotfiles directory and stow the needed packages: 

    $ cd dotfiles
    $ stow zsh
    $ stow tmux

## Add dotfiles 

* Create a folder with related dotfiles (_package_).
* Add files in the _package_
* Create the symlinks in the $HOME directory.

Example: 

    $ cd dotfiles
    $ mkdir zsh
    $ vim zsh/.zshrc
    $ stow zsh

