def load_library(yaml)
  require 'yaml' 
  yaml = "./lib/emoticons.yml"
  emoticon_hash = YAML.load_file("./lib/emoticons.yml")
  n_hash = {}
  n_hash[:get_meaning] = {}
  n_hash[:get_emoticon] = {}
    emoticon_hash.each do |meaning, array_of_emoticons|
      n_hash[:get_meaning][array_of_emoticons[1]] = meaning
    end
    emoticon_hash.each do |meaning, array_of_emoticons|
      n_hash[:get_emoticon][array_of_emoticons[0]] = array_of_emoticons[1]
    end
  return n_hash
end







def get_japanese_emoticon(yaml, western_emoticon)
  n_hash = load_library(yaml)   
    if n_hash[:get_emoticon].has_key?(western_emoticon) == false
      return "Sorry, that emoticon was not found"
    else
      n_hash.each do |get_key, t_hash|
        t_hash.each do |english_emoticon, japanese_emoticon|
          if english_emoticon == western_emoticon
            return japanese_emoticon
          end
        end
      end
    end
end





def get_english_meaning(yaml, other_emoticon)
  n_hash = load_library(yaml)
    if n_hash[:get_meaning].has_key?(other_emoticon) == false
      return "Sorry, that emoticon was not found"
    else
      n_hash.each do |get_key, t_hash|
        t_hash.each do |japanese_emoticon, english_meaning|
          if japanese_emoticon == other_emoticon
            return english_meaning
          end
        end
      end
    end
end