module OutfitCheck
  include SetAttributes
  
  def check_params
    # 短くできそう
    if params[:outfit].nil?
      flash[:alert] = 'アイテムを選択してください。'
    elsif params[:outfit][:top].nil? && params[:outfit][:trouser] && params[:outfit][:shoe]
      flash[:alert] = 'トップスが選択されていません。'
    elsif params[:outfit][:trouser].nil? && params[:outfit][:top] && params[:outfit][:shoe]
      flash[:alert] = 'ボトムスが選択されていません。'
    elsif params[:outfit][:shoe].nil? && params[:outfit][:top] && params[:outfit][:trouser]
      flash[:alert] = 'シューズが選択されていません。'
    elsif params[:outfit][:top].nil? && params[:outfit][:trouser].nil? && params[:outfit][:shoe]
      flash[:alert] = 'トップスとボトムスが選択されていません。'
    elsif params[:outfit][:trouser].nil? && params[:outfit][:shoe].nil? && params[:outfit][:top]
      flash[:alert] = 'ボトムスとシューズが選択されていません。'
    elsif params[:outfit][:top].nil? && params[:outfit][:shoe].nil? && params[:outfit][:trouser]
      flash[:alert] = 'トップスとシューズが選択されていません。'
    elsif params[:outfit][:shoe] && params[:outfit][:top] && params[:outfit][:trouser]
      flash[:alert] = nil
    end
    set_items
  end
end