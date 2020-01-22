#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=git://github.com/kjdev/php-ext-lz4.git
lz4_dir=php-ext-lz4
echo "-----> Building LZ4..."

### LZ4
echo "[LOG] Downloading LZ4"
git clone --recursive --depth=1 $dep_url -q
if [ ! -d "$lz4_dir" ]; then
  echo "[ERROR] Failed to find LZ4 directory $lz4_dir"
  exit
fi
cd $lz4_dir
phpize
./configure
make
make install

cd
echo "Importing extension LZ4 into php.ini"
echo "extension=lz4.so" >> /app/.heroku/php/etc/php/php.ini
