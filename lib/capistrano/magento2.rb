##
 # Copyright © 2016 by David Alger. All rights reserved
 # 
 # Licensed under the Open Software License 3.0 (OSL-3.0)
 # See included LICENSE file for full text of OSL-3.0
 # 
 # http://davidalger.com/contact/
 ##

SSHKit.config.command_map[:magento] = "/usr/bin/env php -f bin/magento --"

module Capistrano
  module Magento2
    module Helpers
      def cache_hosts
        return fetch(:magento_deploy_cache_shared) ? (primary fetch :magento_deploy_setup_role) : (release_roles :all)
      end
    end
  end
end

load File.expand_path('../tasks/magento.rake', __FILE__)

namespace :load do
  task :defaults do
    load 'capistrano/magento2/defaults.rb'
  end
end
