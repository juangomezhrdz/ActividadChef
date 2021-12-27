require'spec_helper'

if os[:family] == 'ubuntu' 
    #packages installed
    describe package('mysql-server') do 
        it { should be_installed } 
    end
    
    describe service('mysql') do
        it { should be_running }
    end
end