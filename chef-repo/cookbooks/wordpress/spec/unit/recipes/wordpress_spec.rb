require 'chefspec'
describe 'wordpress::wordpress' do 
    platform 'ubuntu'

    it 'Acción Descargar Wordpress ' do
      expect(chef_run).to create_remote_file('wordpress').with(path: "/srv/www/latest.tar.gz")
    end

    it 'Acción Crear template de config ' do
      expect(chef_run).to create_template('/srv/www/wordpress/wp-config.php')
      expect(chef_run).to_not create_template('/srv/www/wordpress/not_wp-config.php')
    end
end

describe 'wordpress::wordpress' do 
  platform 'redhat'

  it 'Acción Descargar Wordpress ' do
    expect(chef_run).to create_remote_file('wordpress').with(path: "/srv/www/latest.tar.gz")
  end

  it 'Acción Crear template de config ' do
    expect(chef_run).to create_template('/srv/www/wordpress/wp-config.php')
    expect(chef_run).to_not create_template('/srv/www/wordpress/not_wp-config.php')
  end
end




