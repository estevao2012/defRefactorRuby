require File.expand_path('../profissional', __FILE__)
module Pessoas
  class Medico < Profissional
    attr_accessor :nome, :idade, :especialidade
    attr_reader :profissao
  end
end