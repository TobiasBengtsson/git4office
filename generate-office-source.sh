#!/bin/sh

# MIT License

# Copyright (c) 2018 Tobias Bengtsson

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Find all office files with file size greater than zero (otherwise there
# is nothing to source control)
filePaths=$(find -type f ! -size 0 -iregex ".*\.\(xlsx\|docx\|pptx\)")

for filePath in $filePaths; do
  filePathChangedExtension=$(echo "${filePath%.*}_${filePath##*.}")
  rm -rf $filePathChangedExtension
  mkdir -p $filePathChangedExtension
  unzip $filePath -d $filePathChangedExtension
done
