# -*- mode:ruby; coding:utf-8 -*-

require 'bundler'
Bundler.require
require 'yaml'
ENV_DEV = 'development'
ENV_PRO = 'production'

DIR_ENV = 'config/enviroments/'
DIR_TOKEN = 'config/tokens/'
DIR_SENTENSES = 'config/sentenses/'

FILENAME_CUTIE_POSTS = 'cutie_posts.yml'

def generateEnvFilename(enviroment = ENV_DEV)
  filename = ENV_DEV + ".yml"
  filename = ENV_PRO + ".yml" if enviroment == ENV_PRO
  filename
end

def readEnviroments(filename)
end

def readTokens(filename)
end

def readCutiePosts
end

def readIni
  env_filename = generateEnvFilename(ARGV[0])
  $env = YAML.load_file(DIR_ENV + env_filename)
  $tokens = YAML.load_file(DIR_TOKEN + env_filename)
  $cutie_posts = YAML.load_file(DIR_SENTENSES + FILENAME_CUTIE_POSTS)
end

def requires
  require_relative 'abstracts/abstract_model'
  Dir['abstracts/*.rb'].each {|file| require_relative file}
  Dir['models/*.rb'].each {|file| require_relative file}
  Dir['controllers/*.rb'].each {|file| require_relative file}
end

def getController
  controller_name = ARGV[1].nil? ? 'RegularPost' : ARGV[1]
  Module.const_get(controller_name + 'Controller').new
end

def main
  readIni
  requires
  controller = getController
  controller.execute
end

if __FILE__ == $0
    main
end
