require 'chefspec'
describe 'wordpress::php' do 
    platform 'ubuntu'
    
    it 'Acción de Instalar Package/php' do
        expect(chef_run).to install_package('php')
        expect(chef_run).to_not install_package('not_php')
    end
    it 'Acción de Instalar Package/php-pear' do
        expect(chef_run).to install_package('php-pear')
        expect(chef_run).to_not install_package('not_php-pear')
    end
    it 'Acción de Instalar Package/libapache2-mod-php' do
        expect(chef_run).to install_package('libapache2-mod-php')
        expect(chef_run).to_not install_package('not_libapache2-mod-php')
    end
    it 'Acción de Instalar Package/php-mysql' do
        expect(chef_run).to install_package('php-mysql')
        expect(chef_run).to_not install_package('not_php-mysql')
    end
end

describe 'wordpress::php' do 
    platform 'redhat'

    it 'Acción de Instalar Package/php' do
        expect(chef_run).to install_package('php')
        expect(chef_run).to_not install_package('not_php')
    end
    it 'Acción de Instalar Package/php-mysql' do
        expect(chef_run).to install_package('php-mysqlnd')
        expect(chef_run).to_not install_package('not_php-pear')
    end
    
end
