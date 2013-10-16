maintainer       "Thijs Lensselink"
maintainer_email "tl@lenss.nl"
license          "Apache 2.0"
description      "Dotdeb repositories"
version          "0.1"
recipe           "dotdeb", "main Dotdeb repository"

%w{ debian }.each do |os|
  supports os
end
