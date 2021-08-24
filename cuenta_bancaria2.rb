class Usuario
    def initialize(nombre,cuentas)
        raise TypeError, "Debe contar con al menos una cuenta" if cuentas.count < 1
        @nombre = nombre
        @cuentas = cuentas
    end

    def saldo_total
        total = 0
        @cuentas.each do |cuenta|
            total += cuenta.saldo   
        end
        total
    end
end

class CuentaBancaria
    attr_accessor :nombre, :numero_cuenta, :saldo
    def initialize(nombre,numero_cuenta,saldo = 0)
      @nombre = nombre
      @numero_cuenta = numero_cuenta
      @saldo = saldo 
    end

    def trasnferir(monto,cuenta_destino)
        raise TypeError, "Saldo insuficiente en la cuenta" if monto > @saldo
        @saldo -= monto
        cuenta_destino.saldo += monto
    end
end

cuenta1 = CuentaBancaria.new('banco1',325684,15000)
cuenta2 = CuentaBancaria.new('banco2',985674,2000)

cuenta1.trasnferir(10000, cuenta2)
puts cuenta1.saldo
puts cuenta2.saldo

usuario1 = Usuario.new('usuario_1',[cuenta1,cuenta2])
puts usuario1.saldo_total
