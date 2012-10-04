# Imgix

Super simple wrapper for the imgix.net API.

## Installation

Add this line to your application's Gemfile:

    gem 'imgix'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imgix

## Usage

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
	    :large  => {
	      :h    => 96,
	      :w    => 96,
	      :crop => "faces",
	      :fit  => "crop"
	    }
	  }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
