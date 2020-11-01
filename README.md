# Hastevim

A vim plugin to save and load to and from hastebin.

## Installation
### Install with plugin manager
```vimscript
# Vundle
Plugin 'ijustdev/hastevim'
```

## Usage
If you've selected a code snippet from within the visual mode only this code will be shared on hastebin. Otherwise the whole file.
```
:HasteSave
```

You can also retrieve a code snippet from Hastebin with the unique id.
```
:HasteGet <HasteId>
```
