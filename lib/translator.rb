require "yaml"

def load_library(emoticons)
  result = YAML.load_file(emoticons)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  result.each do |key, val|
    hash['get_emoticon'][val[0]] = result[key][1]
    hash['get_meaning'][val[1]] = key
  end 
  hash
end


def get_japanese_emoticon(path, emoticons)
   path = load_library(path)["get_emoticon"][emoticons]
   
   if path
     path 
   else
     "Sorry, that emoticon was not found"
   end 
end

def get_english_meaning(path, emoticons)
  path = load_library(path)["get_meaning"][emoticons]
   
   if path 
     path
   else
     "Sorry, that emoticon was not found"
   end 
end