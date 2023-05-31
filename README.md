# Neovim Configuration 🔧
## Setup 📥
### Install dependencies
#### Packer
-   Window
```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
#### Node.js
Download installer [here](https://nodejs.org/en/download). It will also install *Python*
#### C compiler
Install MingW by Chocolate with Admin Powershell
```choco install mingw```
### Install formatters
```
npm install -g prettier
pip install --upgrade yapf

```
### Install plugins
- Open nvim
- Run command `:PackerInstall`
## Usage 🎆
### Miscellaneous
### Nvim-tree
| Command  | Usage                  |
|----------|------------------------|
| Ctrl + b | Open nvim-tree         |
| a        | Create new file/folder |
| d        | Remove file/folder     |
| gy       | Copy absolute path     |
| y        | Copy file/folder name  |
| Y        | Copy relative path     |
### Git
| Command    | Usage           |
|------------|-----------------|
| <leader>gs | Open git status |
| <leader>gd | Show git diff   |
| <leader>gb | Show git blame  |
### LSP and format
| Command    | Usage            |
|------------|------------------|
| <leader>rn | Rename variables |
| <leader>fm | Format code      |
### Telescope
TODO
### Comment
TODO
