vim-autoformat-rails
====================

vim-autoformat-rails provides simple formatting of ruby, CSS, SCSS, ERB, and cucumber files.

Installation
------------
If using Vundle, then add the following line to your ```vimrc``` file:

```
Bundle 'KurtPreston/vim-autoformat-rails'
```

If not using Vundle, you can install it by copying the repo to your ```~/vim/bundle``` folder.

Autoformatting within VIM
--------------------------
To call the autoformatter on a document, just type **\==** (backslash, equals, equals).

Autoformatting from console
------------------
If you want to use vim-autoformat-rails to format multiple files, you can use the included **autoformat** binary.  Just copy it to your path (i.e. ```/usr/local/bin```), then you can run commands such as:

```
autoformat FILENAME # Format FILENAME 
autoformat '*.rb'   # Format all Ruby files in the directory
```

Customization
-------------
Most of the formatting rules are simply regex expressions.  If you want to change/remove any the behavior, just add/remove a regex line from the ```vim-autoformat-rails.vim``` file.