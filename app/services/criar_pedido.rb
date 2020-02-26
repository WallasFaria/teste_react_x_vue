class CriarPedido
  def initialize(params)
    @params = params
  end

  def call
    pedido = Pedido.new @params.except(:itens)

    pedido.status = :novo

    Pedido.transaction do
      @params[:itens].each do |p_item|
        pedido.itens << Item.new(p_item)
      end
      pedido.save!
    end

    pedido
  rescue StandardError => e
    OpenStruct.new valid?: false, errors: pedido.errors
  end
end
