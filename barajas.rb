require_relative 'carta.rb'

class Baraja
    attr_accessor :cartas
    def initialize(cartas)
        @cartas = []
        ['C', 'D', 'E', 'T'].map do |pinta|
            13.times do |numero|
                sum_cartas = numero + 1
                @cartas.push(Carta.new(sum_cartas,pinta))
            end
        end
    end

    def barajar
        @cartas.shuffle!
    end
    
    def sacar
       @cartas.pop
    end
    
    def repartir_mano
        array_repartir = []
        for i in 0..4 do
            array_repartir.push(sacar)
        end
        array_repartir
    end
end

naipe = []
n1 = Baraja.new(naipe)
puts n1.cartas[0].pinta
n1.repartir_mano.each do |carta|
    puts "#{carta.pinta} #{carta.numero}"
end