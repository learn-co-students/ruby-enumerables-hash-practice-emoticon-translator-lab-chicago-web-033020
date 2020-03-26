require "yaml"

def load_library(yaml_file)
  
  # loads up the YAML file
  emoticons = YAML.load_file(yaml_file)
  
  # new hash to put in the data in the YAML file
  new_hash = {
    'get_meaning'=> {},
    'get_emoticon'=> {}
  }

  # addss every array item into different hash keys
  emoticons.each do |key, value|
    new_hash['get_meaning'][value[1]] = key
    new_hash['get_emoticon'][value[0]] = emoticons[key][1]
  end
  
  # returns the new hash
  new_hash
end

def get_japanese_emoticon(yaml_file, emoticon)
  
  # sets the value equal to 'japanese_emoticon'
  # loads the yaml file by calling the 'load_library' method
  # when calling the 'load_library' method it brings over the new hash with the new key value pairs
  # '['get_emoticon'][emoticon]' is to grab the passed english emoticon that is in the 'get_emoticon' which is the japanese emoticon
  japanese = load_library(yaml_file)['get_emoticon'][emoticon]
  
  # if japanese_emoticon return false, meaning there is no english emoticon that is equal to the japanese emoticon, it will return that
  
  if !japanese
      return "Sorry, that emoticon was not found"
  end
  
  # returns the emoticon if the if statement above is not evaluted
  japanese
end

def get_english_meaning(yaml_file, emoticon)
    english = load_library(yaml_file)['get_meaning'][emoticon]
    
    if !english
      return "Sorry, that emoticon was not found"
    end
  
  english
end