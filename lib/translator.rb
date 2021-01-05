# require modules here
require 'yaml'
emoji = {}

file='./lib/emoticons.yml'
def load_library(file)
  emoji=YAML.load_file(file)
  hash = {}
  hash[:get_meaning] ={}
  hash[:get_emoticon]={}
  emoji.each_key do |key|
    hash[:get_meaning]["#{emoji[key][1]}"] = "#{key}"
    hash[:get_emoticon]["#{emoji[key][0]}"] = "#{emoji[key][1]}"
  end 
  p hash 
end

def get_japanese_emoticon(file,emoticon)
  hash = load_library(file)
  if hash[:get_emoticon].key?(emoticon)
    p hash[:get_emoticon][emoticon]
  else
    p "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file,emoticon)
  hash = load_library(file)
  if hash[:get_meaning].key?(emoticon)
    p hash[:get_meaning][emoticon]
  else 
    p "Sorry, that emoticon was not found"
  end 
end