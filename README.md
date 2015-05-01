# Pixelator

A command line tool made in elixir to help pixelate any image you want from the command line

## Installing Dependencies
1. Install Elixir using Homebrew

		brew install elixir

2. Install Imagemagick

		brew install imagemagick

3. Git clone this repo

		git clone https://github.com/augustorsouza/pixelator.git

4. Enter the cloned repo directory and install dependencies with mix

		cd pixelator
		mix do deps.get, deps.compile

## How to build

1. Git clone this repo

		git clone https://github.com/augustorsouza/pixelator.git

2. Enter the cloned repo directory and install dependencies with mix

		cd pixelator
		mix do deps.get, deps.compile

3. Build the executable with mix

		mix escript.build

## How to use

1. Git clone this repo

		git clone https://github.com/augustorsouza/pixelator.git

2. Enter the cloned repo directory

		cd pixelator

3. Run the executable passing a --dir parameter that must point to the directory where you put the images you want to pixelate, it will be generated a directory called "pixelated" and save the results there. Also, you need to provide an int option called level that denotes the level of pixelation

		./pixelator --dir /path/to/a/dir/with/the/images --level 5
