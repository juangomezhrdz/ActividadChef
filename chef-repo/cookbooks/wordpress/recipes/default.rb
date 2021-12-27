#install first dependencies
package ["wget", "sudo", "tar"]

include_recipe "wordpress::apache"
include_recipe "wordpress::mysql"
include_recipe "wordpress::php"
include_recipe "wordpress::wordpress"