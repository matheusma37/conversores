# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/conversores'

class ConversorInteirosTest < Minitest::Test
  def setup
    @conversor = Conversores::ConversorRomanosParaInt.new
  end

  def test_I_igual_1
    romano = 'I'
    assert_equal 1, @conversor.converter(romano)
  end

  def test_V_igual_5
    romano = 'V'
    assert_equal 5, @conversor.converter(romano)
  end

  def test_X_igual_10
    romano = 'X'
    assert_equal 10, @conversor.converter(romano)
  end

  def test_L_igual_50
    romano = 'L'
    assert_equal 50, @conversor.converter(romano)
  end

  def test_C_igual_100
    romano = 'C'
    assert_equal 100, @conversor.converter(romano)
  end

  def test_D_igual_500
    romano = 'D'
    assert_equal 500, @conversor.converter(romano)
  end

  def test_M_igual_1000
    romano = 'M'
    assert_equal 1000, @conversor.converter(romano)
  end

  def test_vazia_igual_0
    numero = ''
    assert_equal 0, @conversor.converter(numero)
  end

  def test_nil_igual_0
    numero = nil
    assert_equal 0, @conversor.converter(numero)
  end

  def test_II_igual_2
    numero = 'II'
    assert_equal 2, @conversor.converter(numero)
  end

  def test_III_igual_3
    numero = 'III'
    assert_equal 3, @conversor.converter(numero)
  end

  def test_XX_igual_20
    numero = 'XX'
    assert_equal 20, @conversor.converter(numero)
  end

  def test_CC_igual_200
    numero = 'CC'
    assert_equal 200, @conversor.converter(numero)
  end

  def test_VI_igual_6
    numero = 'VI'
    assert_equal 6, @conversor.converter(numero)
  end
end
