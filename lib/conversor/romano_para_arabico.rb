# frozen_string_literal: true

module Conversor
  class RomanoParaArabico
    VALORES_BASE = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }.freeze

    def converter(romano)
      return VALORES_BASE[romano] unless VALORES_BASE[romano].nil?

      valor = 0
      if !romano.nil? && !romano.empty?
        romanos = romano.chars
        valor += romanos.size * VALORES_BASE[romanos[0]]
      end
      valor
    end
  end
end
