require 'yaml'

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end 
  result
end

def get_japanese_emoticon(file_path, e_emotes)
  library = load_library(file_path)
  if library["get_emoticon"].include?(e_emotes)
    library["get_emoticon"][e_emotes]
  else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, j_emotes)
  library = load_library(file_path)
  if library["get_meaning"].include?(j_emotes)
    library["get_meaning"][j_emotes]
  else 
    "Sorry, that emoticon was not found"
  end 
end