require "yaml"
require 'pry'
# require modules here

def load_library(file)
  # code goes here
  emo = YAML.load_file(file)
  emo
  emohash = {}
  meanhash = {}
  emo.each do |meaning, value|
    meanhash[value[1]] = meaning
    emohash[value[0]] = value[1]
  end
  hash = {"get_meaning": meanhash, "get_emoticon": emohash}
end

def get_japanese_emoticon(file, engemo)
  # code goes here
  hash1 = load_library(file)
  jemo = hash1[:get_emoticon][engemo]
  if jemo == nil 
    return msg = "Sorry, that emoticon was not found"
  else
    return jemo
  end
end

def get_english_meaning(file, jemo_in)
  # code goes here
  hash2 = load_library(file)
  mean_out = hash2[:get_meaning][jemo_in]
  if mean_out == nil 
    return msg = "Sorry, that emoticon was not found"
  else
    return mean_out
  end
end