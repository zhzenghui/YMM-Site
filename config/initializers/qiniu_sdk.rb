#!/usr/bin/env ruby

require 'qiniu'


path = File.join(Rails.root, "config", "setting.yml")
if File.exists?(path)
    qiniu = YAML.load_file(path)
    qiniu_object = qiniu["qiniu"] 
    access_key = qiniu_object["access_key"]
    secret_key = qiniu_object["secret_key"]
    logger.info(access_key)
end


Qiniu.establish_connection! :access_key => access_key,
                            :secret_key => secret_key
