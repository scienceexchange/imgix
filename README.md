# Imgix

Super simple wrapper for the imgix.net API.

## Installation

Add this line to your application's Gemfile:

    gem 'imgix'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install imgix

## Usage

Basic configuration in the model

	class User < ActiveRecord::Base
		has_imgix_attachment :photo,
		  :subdomain  => "demo",
		  :prefix     => "avatars",
		  :default    => "default.png",
		  :styles =>  {
		    :small  => {
		      :h    => 32,
		      :w    => 32,
		      :crop => "faces",
		      :fit  => "crop"
		    },
		    :medium => {
		      :h    => 64,
		      :w    => 64,
		      :crop => "faces",
		      :fit  => "crop"
		    },
	      medium_wm: {
	        h:   340,
	        w:   420,
	        fit: 'crop',
	        mark: '/relative/watermark/path/Watermark1.png',
	        markscale: 40,
	        markpad: 20,
	        markalign: 'center,middle'
	      },
		    :large  => {
		      :h    => 96,
		      :w    => 96,
		      :crop => "faces",
		      :fit  => "crop"
		    }
		  }
	end

Retrieve the original image

	@user.photo.url
	> "http://demo.imgix.net/avatars/filename.jpg"

Retrieve a specific style

	@user.photo.url(:medium)
	> "http://demo.imgix.net/avatars/filename.jpg?crop=faces&fit=crop&h=64&w=64"

Generate an image tag

	imgix_tag(@user.photo, "medium", :alt => "test photo")
	> "<img src="http://demo.imgix.net/avatars/filename.jpg?crop=faces&fit=crop&h=64&w=64" alt="test photo" />"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
