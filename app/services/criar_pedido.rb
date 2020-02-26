class CriarPedido
  def initialize(params)
    @params = params
  end

  def call
    Pedido.transaction do
      pedido = Pedido.new @params.except(:itens)
      @params[:itens].each do |p_item|
        pedido.itens << Item.new(p_item)
      end
      pedido.save!
    end
  rescue StandardError => e
    OpenStruct.new valid?: false, errors: e
  end
end
