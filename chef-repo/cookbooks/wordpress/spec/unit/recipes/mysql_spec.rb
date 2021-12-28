require 'chefspec'
describe 'wordpress::mysql' do 
    platform 'ubuntu'

    it 'Acción de Instalar Package/mysql-server' do
        expect(chef_run).to install_package('mysql-server')
        expect(chef_run).to_not install_package('not_mysql-server')
    end

    it 'Acción de reiniciar Apache2' do
      expect(chef_run).to restart_service('apache2')
    end
end
