# fecompressor.vim

fecompressor.vim is designed to auto execute compressor programes while edit
and saving files used in the front end. It supports js, coffescript, css, less
and scss.

## Feature

- Support Compressors: UglifyJS, Closure Compiler, YUICompressor, LESS, Sass, CoffeeScript
- Support File Type: css, js, less, scss, coffee

## Usage

Make sure your system have installed the compressor you need. The plugin will 
check if the following command is available.

- 'uglifyjs' for UglifyJS
- 'closure-compiler' for Closure Compiler
- 'yuicompressor' for YUICompressor
- 'lessc' for LESS
- 'sass' for scss
- 'coffee' for CoffeeScript

Then it will do the following stuff for you.

For less and scss:

1. Convert the file to css.
2. Do stuffs for css file.

For coffee:

1. Convert the file to js.
2. Do stuffs for js file.

For css and js file:

1. Check if the target output file is exist.
2. If exists, compress the file.

The target output file have the following rule:

- ```foo_src.css -> foo.css```
- ```bar.css -> bar.min.css```

## License

Copyright (c) 2010 Wei-Ko Kao

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

