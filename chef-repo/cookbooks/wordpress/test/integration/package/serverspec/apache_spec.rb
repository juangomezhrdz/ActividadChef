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
elsif os[:family] == 'redhat' 
    #packages installed
    describe package('httpd') do 
        it { should be_installed } 
    end
    
    describe service('httpd') do
        it { should be_running }
    end
    
    describe port(80) do
        it { should be_listening }
    end
end
