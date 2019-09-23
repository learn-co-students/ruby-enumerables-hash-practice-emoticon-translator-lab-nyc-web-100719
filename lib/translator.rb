# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  emoticons_hash = {:get_meaning => {}, :get_emoticon => {}}
  library.each do |meaning, emoticon|
    emoticons_hash[:get_meaning][emoticon[1]] = meaning
    emoticons_hash[:get_emoticon][emoticon[0]] = emoticon[1]
  end
  emoticons_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library[:get_emoticon][emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    library[:get_emoticon][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library[:get_meaning][emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    library[:get_meaning][emoticon]
  end
end