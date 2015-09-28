require 'upyun'

path = File.join(Rails.root, "config", "setting.yml")

upyun_info = YAML.load_file(path)
upyun_object = upyun_info["upyun"] 

bucket = upyun_object["bucket"]
operator = upyun_object["operator"]
password = upyun_object["password"]



$upyun = Upyun::Rest.new(bucket, operator, password, nil, nil)