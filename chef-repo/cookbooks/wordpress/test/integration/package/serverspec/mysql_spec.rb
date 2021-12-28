require'spec_helper'

#packages installed
describe package('mysql-server') do 
    it { should be_installed } 
end

if os[:family] == 'ubuntu' 
    describe service('mysql') do
        it { should be_running }
    end
elsif os[:family] == "redhat"
    describe service('mysqld') do
        it { should be_running }
    end
end