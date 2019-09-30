# require modules here
require "yaml"


def load_library(path)
  # code goes here
  emoticon_original = YAML.load_file(path)
  emoticon_data ={'get_meaning' =>{},'get_emoticon' =>{}}
  emoticon_original.each{|emo_nam, emots|
  emoticon_data['get_meaning'][emots[1]] = emo_nam
  emoticon_data['get_emoticon'][emots[0]] = emots[1]
  }
  emoticon_data
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  emoticon_data = load_library(path)
  return emoticon_data['get_emoticon'][emoticon] if emoticon_data['get_emoticon'][emoticon] != nil
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticon_data = load_library(path)
  return emoticon_data['get_meaning'][emoticon] if emoticon_data['get_meaning'][emoticon] != nil
  "Sorry, that emoticon was not found"
end