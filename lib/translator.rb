# require modules here

require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticon|
    result["get_meaning"][emoticon[1]] = meaning
    result["get_emoticon"][emoticon[0]] = emoticons[1]
end

result

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end