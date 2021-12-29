require 'chefspec'
describe 'wordpress::apache' do 
    platform 'ubuntu'

    it 'Acción de Instalar Package/Apache2' do
        expect(chef_run).to install_package('apache2')
        expect(chef_run).to_not install_package('not_apache2')
      end
    it 'Acción de eliminar 000-default.conf de Apache' do
        expect(chef_run).to delete_file('/etc/apache2/sites-enabled/000-default.conf')
        expect(chef_run).to_not delete_file('/etc/apache2/sites-enabled/not_000-default.conf')
      end 
    it 'Acción que excluye al servicio :nothing' do
        expect(chef_run).to start_service('apache2')
      end
end

describe 'wordpress::apache' do 
  platform 'redhat'

  it 'Acción de Instalar Package/httpd' do
      expect(chef_run).to install_package('httpd')
      expect(chef_run).to_not install_package('not_httpd')
    end

    it 'Acción que inicia servicio' do
      expect(chef_run).to start_service('httpd')
    end
end