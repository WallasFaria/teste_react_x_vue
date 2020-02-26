class CancelarPedido
  def initialize(params, cliente)
    @pedido = cliente.pedidos.find(params[:pedido_id])
  end

  def call
    unless @pedido.pode_ser_cancelado?
      error = 'status atual não permite cancelamento'
      return OpenStruct.new valid?: false, errors: {base: [error]}
    end

    @pedido.cancelado!
    @pedido
  end
end
