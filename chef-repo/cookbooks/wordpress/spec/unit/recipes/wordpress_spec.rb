require 'chefspec'
describe 'wordpress::wordpress' do 
    platform 'ubuntu'

    it 'Acción descomprimir wordpress y cp ' do
      expect(chef_run).to run_execute('tar xzvf latest.tar.gz && cp -r /wordpress/* /srv/www/wordpress')
    end

    it 'Acción Crear template de config ' do
      expect(chef_run).to create_template('/srv/www/wordpress/wp-config.php')
      expect(chef_run).to_not create_template('/srv/www/wordpress/not_wp-config.php')
    end
end

describe 'wordpress::wordpress' do 
  platform 'redhat'

  it 'Acción descomprimir wordpress y cp ' do
    expect(chef_run).to run_execute('tar xzvf latest.tar.gz && cp -r /wordpress/* /srv/www/wordpress')
  end

  it 'Acción Crear template de config ' do
    expect(chef_run).to create_template('/srv/www/wordpress/wp-config.php')
    expect(chef_run).to_not create_template('/srv/www/wordpress/not_wp-config.php')
  end
end




