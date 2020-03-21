require "yaml"
require "pry"

def load_library(file_name)
  library = {:get_meaning => {}, :get_emoticon => {}}
  emoticons = YAML.load_file(file_name)
  emoticons.each do |moods, emotis|
    library[:get_meaning][emotis[1]] = moods
    library[:get_emoticon][emotis[0]] = emotis[1]
  end
  library
end

def get_japanese_emoticon(file_name, emoticon)
  library = load_library(file_name)
  response = nil
  library[:get_emoticon].each do |english, japanese|
    if emoticon == english
      response = japanese
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  end
  return response
end

def get_english_meaning(file_name, emoticon)
  library = load_library(file_name)
  response = nil
  library[:get_meaning].each do |japanese, english|
    if emoticon == japanese
      response = english 
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  end
  return response
end