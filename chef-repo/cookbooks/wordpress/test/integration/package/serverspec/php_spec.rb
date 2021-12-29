
require'spec_helper'

describe package('php') do
  it { should be_installed }
end

describe package('php-mysql'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('php-mysqlnd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end