maintainer "Thijs Lensselink"
maintainer_email "tl@lenss.nl"
license "Apache 2.0"
description "Install PEAR packages"
version "0.1"
recipe "pear", "The PEAR package"
recipe "pear::phpunit", "Unit testing for PHP"

%w{ debian }.each do |os|
  supports os
end
