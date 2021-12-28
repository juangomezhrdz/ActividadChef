#package ['php', 'php-cli', 'php-mysql', 'libapache2-mod-php']
package 'php'
package 'php-pear'

if platform_family?('ubuntu')
    package 'libapache2-mod-php'
    package 'php-mysql'
else
    package 'php-mysqlnd'
end


