vim-autoformat-rails
====================

vim-autoformat-rails provides simple autoformatting of ruby, CSS, SCSS, ERB, and cucumber files.

It will fix indentation, remove trailing whitespace, and standardize spacing (e.g. always have empty lines between Ruby method declarations, always open CSS curly brackets on the same line as the selector).

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

Examples
--------

### CSS
Before:

```css
#selector, input:hover

{

  font-size:13px;
     height     :        20px;     }


```

After:

```css
#selector, input:hover {
  font-size: 13px;
  height: 20px;
}

```

### Ruby
Before:

```ruby
def test_function(x)

         if x > 2

           return false
         else
             return true

         end

     end

```

After:

```ruby
def test_function(x)
  if x > 2
    return false
  else
    return true
  end
end

```
