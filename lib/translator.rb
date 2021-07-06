# require modules here
require 'yaml'
require 'pry'
def load_library(file_path)
  emoticons = YAML.load(File.read(file_path))
  hash = {"get_emoticon": {},
          "get_meaning": {}
          }
  
  emoticons.each do |meaning, value|
    e_emoji = emoticons[meaning][0]
    j_emoji = emoticons[meaning][1]
    hash[:get_meaning][j_emoji] = meaning 
    hash[:get_emoticon][e_emoji] = j_emoji
     
  end
  hash 
end


def get_japanese_emoticon(file_path, input_emoji)
  emoticon_hash = load_library(file_path)
  
  emoticon_hash[:get_emoticon].each do |e_emoji, j_emoji|
    if input_emoji == e_emoji
      return j_emoji
    end 
  end 
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, input_emoji)
  emoticon_hash = load_library(file_path)
  
  emoticon_hash[:get_meaning].each do |j_emoji, meaning|
    if input_emoji == j_emoji
      return meaning 
    end 
  end 
  return "Sorry, that emoticon was not found"
end