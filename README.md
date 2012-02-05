# The Mobile Pirate! 
Only insanely useful if you're using [the\_rotten\_pirate](https://github.com/hjhart/the_rotten_pirate) as well...

### Quick 'n' dirty

A simple server that provides UI to download any movie from the rotten pirate.

[the\_rotten\_pirate](https://github.com/hjhart/the_rotten_pirate) then takes over and runs a rake task to download those movies.

### Setup

Just start the server.

	rackup
	
Enter in some movies. It will append these movies to the `movies_to_download.txt` file.

On the other end, you'll need to install `the_rotten_pirate`. `cd` to that directory.

Inside of the `config/config.yml` file, set the watch_file to the `movies_to_download.txt` file.

Set up a cronjob (using wheneverize) to run the rake task. I set mine up to check the file every five minutes. You can edit the config/schedule.rb to change the duration that the rake task runs.

Whilst in the\_rotten\_pirate directory run the following command:
	
	whenever
	
This will produce output that should be pasted into your crontab

	crontab -e # to edit your crontab. You may want to do this on a user basis.

You can also run the rake task manually inside `the_rotten_pirate's` directory

	rake download_from_watch_file
	

### Aside

This is a freakin' server that appends inputs to a file. It's not rocket science. Nor is it secure. But it is pretty handy.

I tried figuring out a way to invoke the rake tasks to the\_rotten\_pirate. This was unfruitful, and I decided to just stop going that direction. If someone can figure out how to do that, pull requests would be welcome.

### Epiphone 

Oh, I should just merge this code into the freakin' the\_rotten\_pirate repository. So, that's a TODO.

