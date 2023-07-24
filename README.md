# Neovim Configuration 🔧

## Setup 📥

### Install dependencies

#### Packer

- Window

```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

#### Node.js

Download installer [here](https://nodejs.org/en/download). It will also install _Python_

#### C compiler

Install MingW by Chocolate with Admin Powershell
`choco install llvm`

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
| -------- | ---------------------- |
| Ctrl + b | Open nvim-tree         |
| a        | Create new file/folder |
| d        | Remove file/folder     |
| gy       | Copy absolute path     |
| y        | Copy file/folder name  |
| Y        | Copy relative path     |

### Git

| Command     | Usage           |
| ----------- | --------------- |
| Leader + gs | Open git status |
| Leader + gd | Show git diff   |
| Leader + gb | Show git blame  |

### LSP and format

| Command     | Usage              |
| ----------- | ------------------ |
| Leader + rn | Rename variables   |
| Leader + fm | Format code        |
| Leader + e  | Show full error    |
| Leader + d  | Show documentation |

### Telescope

| Command                    | Usage                                   |
| -------------------------- | --------------------------------------- |
| Ctrl + f                   | Find files                              |
| Ctrl + g                   | Grep file                               |
| Leader + b                 | Buffers                                 |
| Leader + gf                | Grep in current file (deprecated)       |
| Select text and Leader + g | Grep in current file with selected text |
| Select text and Leader + G | Grep in all files with selected text    |

### Comment

| Command/key     | Usage                       |
| --------------- | --------------------------- |
| gcc             | Toggle comment current line |
| [Visual mod] gc | Toggle comment in a block   |

### Outline

Command `:SymbolsOutline` to toggle Symbols Outline. Use key `h` and `l` to fold and unfold

### Motion

| Command     | Usage                           |
| ----------- | ------------------------------- |
| Leader + hw | Fastly move to words            |
| Leader + hl | Fastly move to begin of lines   |
| Leader + hp | Fastly move with search pattern |
| Leader + hv | Fastly move in vertical column  |

### Search and replace

| Command/key | Usage                                |
| ----------- | ------------------------------------ |
| Leader + S  | Open search and replace buffer       |
| Leader + sw | Search with the current selected tex |
| Leader + sp | Search in the current file           |

### Preview definitions

| Command/key  | Usage                             |
| ------------ | --------------------------------- |
| Leader + gpd | Open preview definition           |
| Leader + gpt | Open preview type definition      |
| Leader + gpi | Open preview implement definition |
| Leader + gpr | Open preview references           |
