# frozen_string_literal: true

# Modulo de conversores
module Conversores
  # Converte inteiros em romanos
  class ConversorIntParaRomanos
    VALORES_BASE = {
      1 => 'I',
      5 => 'V',
      10 => 'X',
      50 => 'L',
      100 => 'C',
      500 => 'D',
      1000 => 'M'
    }.freeze

    KEYS = [1000, 500, 100, 50, 10, 5, 1].freeze

    def converter(valor)
      aux = validar_entrada valor
      return aux unless aux.empty?

      quociente = valor.to_i

      KEYS.reduce('') do |romano, key|
        atual = KEYS.find_index(key)
        numeral, quociente = selecionador(atual, *quociente.divmod(key))
        romano + numeral
      end
    end

    private

    def validar_entrada(valor)
      VALORES_BASE[valor].nil? ? '' : VALORES_BASE[valor]
    end

    def selecionador(atual, quociente, resto)
      romano =
        if resto.to_s[0] == '4' && resto >= KEYS[atual + 1]
          resto -= resto / KEYS[atual + 1]
          VALORES_BASE[KEYS[atual + 1]] + VALORES_BASE[KEYS[atual]]
        elsif resto.to_s[0] == '9' && resto >= KEYS[atual + 1]
          resto -= resto / KEYS[atual + 2]
          VALORES_BASE[KEYS[atual + 2]] + VALORES_BASE[KEYS[atual]]
        else
          VALORES_BASE[KEYS[atual]] * quociente
        end
      [romano, resto]
    end
  end

  class ConversorRomanosParaInt
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
        romanos = romano.split('')
        valor += romanos.size * VALORES_BASE[romanos[0]]
      end
      valor
    end
  end
end
