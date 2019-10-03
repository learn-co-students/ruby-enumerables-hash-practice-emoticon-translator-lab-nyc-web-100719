# require modules here
require 'pry'
require "yaml"


def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoji_arr = []
  emoticons.each do |emotion, emojis|
    new_hash['get_meaning'][emojis[1]] = emotion
    new_hash['get_emoticon'][emojis[0]] = emojis[1]
  end
  new_hash
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)
  emoticons['get_emoticon'].each do |english, japanese|
    if emoticon == english
      return japanese
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  emoticons['get_meaning'].each do |japanese, emotion|
    if emoticon == japanese
      return emotion
    end
  end
  return "Sorry, that emoticon was not found"
end
