require'spec_helper'

if os[:family] == 'ubuntu' 
    #packages installed
    describe package('apache2') do 
        it { should be_installed } 
    end
    
    describe service('apache2') do
        it { should be_running }
    end
    
    describe port(8080) do
        it { should be_listening }
    end
end