# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
 file = YAML.load_file(file_path)
 hash = {
   get_meaning: {},
   get_emoticon:{}
 }
 file.each do |key, value|
   english_emoticon = value[0]
   japanese_emoticon = value[1]
   hash[:get_meaning][japanese_emoticon] = key
   hash[:get_emoticon][english_emoticon] = japanese_emoticon
  end
 hash
end

def get_japanese_emoticon(file_path, emoticon)
  file = load_library(file_path)
  file[:get_emoticon].each do |key, value|
      if key == emoticon
      return value
    end
    end
   return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  file = load_library(file_path)
  file[:get_meaning].each do |key, value|
    if key == emoticon
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end