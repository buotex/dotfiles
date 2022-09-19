function azlogin --wraps='az login &&  az acr login --name halfdomemasterbdcmirrored' --description 'alias azlogin=az login &&  az acr login --name halfdomemasterbdcmirrored'
  az login &&  az acr login --name halfdomemasterbdcmirrored $argv; 
end
