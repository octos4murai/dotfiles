# dotfiles

These are my personal dotfiles, along with various configuration-related things. For my own convenience, a simple bash script is included to quickly create symbolic links.

## Setup
1. Clone this repo.
2. Modify the provided file `config` or create your own.
    + The input file is read by the script `dotfiles` to determine what symbolic links to create.
    + Each row corresponds to a link and is space-delimited.
    + The first field is a tag used to identify which lines `dotfiles` should read.
    + The second and third fields are the *target* and *link*, respectively.
3. Run `dotfiles`.

        $ bash dotfiles --file config --tag ubuntu
