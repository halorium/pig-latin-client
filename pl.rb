#!/usr/bin/env ruby

require 'pig_latin'

module Translator
end

require_relative 'pig-latin/pig_latin_client.rb'

Translator::Client.welcome

begin
  ('%s> ' % '>').display
  input = gets.chomp
  args = input.split /\s/

  Translator::Client.process_command(args)
end while Translator::Client.running?
