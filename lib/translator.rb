require 'pry'
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = { }
  new_hash[:get_meaning] = { }
  new_hash[:get_emoticon] = { }
  emoticons.each do |key, value|
    japanese_emoticon = emoticons[key][1]
    english_emoticon = emoticons[key][0]
   
    new_hash[:get_meaning][japanese_emoticon] = key
    new_hash[:get_emoticon][english_emoticon] = japanese_emoticon
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  japanese_version = hash[:get_emoticon][emoticon]
  if !japanese_version
    sorry_message = "Sorry, that emoticon was not found"
    return sorry_message
  end
  japanese_version
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  english_version = hash[:get_meaning][emoticon]
  if !english_version
    sorry_message = "Sorry, that emoticon was not found"
    return sorry_message
  end
  english_version
end
