# frozen_string_literal: true

require_relative '../test_helper'

class ArabicoParaRomanoTest < Minitest::Test
  def setup
    @conversor = Conversor::ArabicoParaRomano.new
  end

  def test_1_igual_I
    numero = 1
    assert_equal 'I', @conversor.converter(numero)
  end

  def test_5_igual_V
    numero = 5
    assert_equal 'V', @conversor.converter(numero)
  end

  def test_10_igual_X
    numero = 10
    assert_equal 'X', @conversor.converter(numero)
  end

  def test_50_igual_L
    numero = 50
    assert_equal 'L', @conversor.converter(numero)
  end

  def test_100_igual_C
    numero = 100
    assert_equal 'C', @conversor.converter(numero)
  end

  def test_500_igual_D
    numero = 500
    assert_equal 'D', @conversor.converter(numero)
  end

  def test_1000_igual_M
    numero = 1000
    assert_equal 'M', @conversor.converter(numero)
  end

  def test_0_igual_vazia
    numero = 0
    assert_equal '', @conversor.converter(numero)
  end

  def test_nil_igual_vazia
    numero = nil
    assert_equal '', @conversor.converter(numero)
  end

  def test_2_igual_II
    numero = 2
    assert_equal 'II', @conversor.converter(numero)
  end

  def test_3_igual_III
    numero = 3
    assert_equal 'III', @conversor.converter(numero)
  end

  def test_20_igual_XX
    numero = 20
    assert_equal 'XX', @conversor.converter(numero)
  end

  def test_200_igual_CC
    numero = 200
    assert_equal 'CC', @conversor.converter(numero)
  end

  def test_6_igual_VI
    numero = 6
    assert_equal 'VI', @conversor.converter(numero)
  end

  def test_16_igual_XVI
    numero = 16
    assert_equal 'XVI', @conversor.converter(numero)
  end

  def test_166_igual_CLXVI
    numero = 166
    assert_equal 'CLXVI', @conversor.converter(numero)
  end

  def test_600_igual_DC
    numero = 600
    assert_equal 'DC', @conversor.converter(numero)
  end

  def test_4_igual_IV
    numero = 4
    assert_equal 'IV', @conversor.converter(numero)
  end

  def test_9_igual_IX
    numero = 9
    assert_equal 'IX', @conversor.converter(numero)
  end

  def test_3888_igual_MMMDCCCLXXXVIII
    numero = 3888
    assert_equal 'MMMDCCCLXXXVIII', @conversor.converter(numero)
  end
end
