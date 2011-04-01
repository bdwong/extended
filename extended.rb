#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'erb'
require 'firstgem'

# Manual form for testing.
get "/" do
  erb :form
end

# Do the api action
post "/" do
  puts @params.inspect
  c = Calculator.new
  c.name = "Fred"
  result = "#{c.name} says: "

  a = @params['mul1']
  b = @params['mul2']
  if !a.empty? and !b.empty? then
    result += "<br />#{a} * #{b} = #{c.Multiply(a.to_f, b.to_f)}"
  end
    
  a = @params['add1']
  b = @params['add2']
  if !a.empty? and !b.empty? then
    result += "<br />#{a} + #{b} = #{c.Add(a.to_f, b.to_f)}"
  end
  
  result
end

