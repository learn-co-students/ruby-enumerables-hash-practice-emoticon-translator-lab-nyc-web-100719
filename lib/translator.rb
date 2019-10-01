# require modules here
require "yaml"
require "pry"

def load_library(filePath)
  # code goes here
  
  lib = YAML.load_file(filePath)
  
  newHash = Hash.new
  
  newHash = {
    get_meaning: Hash.new,
    get_emoticon: Hash.new
  }
  
  #iterate through each key and place appropriately
  # lib[key][0] is English emoticon
  # lib[key][1] is Japanese equivalent
  lib.each { |key, value| 
    newHash[:get_emoticon][value[0]] = value[1]
    newHash[:get_meaning][value[1]] = key
  
  }
  
  #binding.pry
    
  
  
  newHash
  #puts lib
  
end


def get_japanese_emoticon(filePath, englishEmoticon)
  # code goes here
  hash = load_library(filePath)
  
  if (hash[:get_emoticon].has_key?(englishEmoticon))
    return hash[:get_emoticon][englishEmoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(filePath, japaneseEmoticon)
  # code goes here
  hash = load_library(filePath)
  
  if (hash[:get_meaning].has_key?(japaneseEmoticon))
    return hash[:get_meaning][japaneseEmoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end