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
```choco install llvm```
### Install formatters
```
npm install -g prettier lua-fmt
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
| Command                    | Usage                                   |
|----------------------------|-----------------------------------------|
| Ctrl + f                   | Find files                              |
| Ctrl + g                   | Grep file                               |
| Leader + b                 | Buffers                                 |
| Leader + gf                | Grep in current file (deprecated)       |
| Select text and Leader + g | Grep in current file with selected text |
| Select text and Leader + G | Grep in all files with selected text    |
### Comment
| Command/key     | Usage                       |
|-----------------|-----------------------------|
| gcc             | Toggle comment current line |
| [Visual mod] gc | Toggle comment in a block   |
### Outline
Command `:SymbolsOutline` to toggle Symbols Outline.  Use key `h` and `l` to fold and unfold
