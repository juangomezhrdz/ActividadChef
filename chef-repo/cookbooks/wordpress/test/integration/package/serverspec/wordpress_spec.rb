require'spec_helper'

if os[:family] == 'ubuntu' 
    #packages installed
    describe file("/srv/www/wordpress") do 
        it { should be_directory } 
    end

    describe file("/srv/www/wordpress/wp-config.php") do 
        it { should be_file } 
    end
end