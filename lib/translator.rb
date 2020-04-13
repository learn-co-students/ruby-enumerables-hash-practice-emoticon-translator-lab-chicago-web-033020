# Other ways: https://github.com/deniznida/emoticon-translator-ruby-007-public/blob/master/lib/translator.rb
require 'pry'
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    #the keys inside the 'get_meaning' hash are the Japanese emoticons
    #the emoticon keys inside the 'get_meaning' hash point to their meanings
  #{"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel"}
                       #emoticons[1]=> "☜(⌒▽⌒)☞"
  result["get_meaning"][emoticons[1]] = meaning  # "angel"
  #the keys inside the 'get_emoticon' hash are the English emoticons
  #the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents
  #"get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}
  #emoticons[0]=> "O:)"                 #emoticons[1]=> "☜(⌒▽⌒)☞"
  result["get_emoticon"][emoticons[0]] = emoticons[1]  #"☜(⌒▽⌒)☞"
  end
  result
  # {"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel"}, "get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞"}}
end


# This method will take a traditional Western emoticon, like :) and translate it to its Japanese version.
# It will rely load_library to work. Refer to the table below for translations
def get_japanese_emoticon(file_path, emoticon)
  japanese_emoticon = load_library(file_path)["get_emoticon"][emoticon] # "(＾ｖ＾)"
   japanese_emoticon ? japanese_emoticon : "Sorry, that emoticon was not found"
  # if japanese_emoticon == nil
  #   japanese_emoticon = "Sorry, that emoticon was not found"
  # end
  # japanese_emoticon
end

# It will take a Japanese emoticon and returns its meaning in English.
# This method will also rely on load_library to first load the YAML file.
def get_english_meaning(file_path, emoticon)
  meaning = load_library(file_path)["get_meaning"][emoticon]  #sad
  meaning ? meaning : "Sorry, that emoticon was not found"
  # if meaning == nil
  #   meaning = "Sorry, that emoticon was not found"
  # end
  # meaning
end
