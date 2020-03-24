

require 'yaml'

def load_library(path)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |meaning, describe|
     eng,jpn = describe
     emoticons["get_meaning"][jpn] = meaning
     emoticons["get_emoticon"][eng] = jpn
  end
  emoticons
end
# def load_library (path)
#   # p emoticons
#   # p "==============="
#   emohash ={"get_meaning" => {}, "get_emoticon" => {}}
#   YAML.load_file(path).each do |word, emos|
#     emos1,emos2 = emos
#     emohash["getting_meaning"][emos2] = word
#     emohash["get_emoticon"][emos1] = emos2
#   end
#   emohash
# end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_emoticon"][emoticon]
    if result
      result
    else
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_meaning"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end
