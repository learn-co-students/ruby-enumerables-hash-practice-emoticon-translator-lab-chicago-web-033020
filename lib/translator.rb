require 'yaml'
require 'pry'
# require modules here

def load_library(fp)
hash = {}

emoticons = YAML.load_file(fp)

hash["get_emoticon"] = {}
hash["get_meaning"] = {}

emoticons.each do |eng, emos|
  hash["get_emoticon"][emos.first] = emos.last
 hash["get_meaning"][emos.last] = eng
 end
 hash
  # code goes here
end

def get_japanese_emoticon(fp, emo)
  hash = load_library(fp)
  final = hash["get_emoticon"][emo]
  
if final == nil
  final = "Sorry, that emoticon was not found"
end
#binding.pry
final
  
  # code goes here
end

def get_english_meaning(fp, emo)
  hash = load_library(fp)
  final = hash["get_meaning"][emo]
  #binding.pry
  if final == nil
    final = "Sorry, that emoticon was not found"
  end
  final
  # code goes here
end