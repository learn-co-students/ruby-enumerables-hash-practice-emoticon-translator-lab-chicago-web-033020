# require modules here
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    #the keys inside the 'get_meaning' hash are the Japanese emoticons
    #the emoticon keys inside the 'get_meaning' hash point to their meanings
  result["get_meaning"][emoticons[1]] = meaning
  #the keys inside the 'get_emoticon' hash are the English emoticons
  #the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents
  result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file_path, emoticon)
  japanese_emoticon = load_library(file_path)['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"

end

def get_english_meaning(file_path, emoticon)
  meaning = load_library(file_path)['get_meaning'][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end
