# frozen_string_literal: true

# Converte inteiros em romanos
class ConversorIntToRomanos
  VALORES_BASE = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }.freeze

  def converter(valor)
    return '' if valor.nil?

    aux = VALORES_BASE[valor]
    return aux unless aux.nil?

    aux = ''

    keys = VALORES_BASE.keys.sort.reverse
    atual = 0
    quociente = valor

    until keys[atual].nil?
      quociente, resto = quociente.divmod(keys[atual])
      aux +=
        if resto.to_s[0] == '4' && resto >= keys[atual + 1]
          resto -= resto / keys[atual + 1]
          VALORES_BASE[keys[atual + 1]] + VALORES_BASE[keys[atual]]
        elsif resto.to_s[0] == '9' && resto >= keys[atual + 1]
          resto -= resto / keys[atual + 2]
          VALORES_BASE[keys[atual + 2]] + VALORES_BASE[keys[atual]]
        else
          VALORES_BASE[keys[atual]] * quociente
        end
      quociente = resto
      atual += 1
    end
    aux
  end
end
