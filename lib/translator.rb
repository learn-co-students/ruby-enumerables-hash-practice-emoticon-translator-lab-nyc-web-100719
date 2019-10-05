# require modules here
require "yaml"

def load_library(file_path)
  raw_data = YAML.load_file(file_path)
  
  data = {'get_meaning' => {}, 'get_emoticon' => {}}
  
  raw_data.each do |emotion, emoticon_array|
    jpn_emoticon = emoticon_array[1]
    eng_emoticon = emoticon_array[0]
    data['get_meaning'][jpn_emoticon] = emotion
    data['get_emoticon'][eng_emoticon] = jpn_emoticon
  end
  
  return data
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  data = load_library(file_path)
  
  data['get_emoticon'].each do |face, emotion|
    if (emoticon == face)
      return emotion
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  data = load_library(file_path)
  
  data['get_meaning'].each do |face, emotion|
    if (emoticon == face)
      return emotion
    end
  end
  return "Sorry, that emoticon was not found"
end