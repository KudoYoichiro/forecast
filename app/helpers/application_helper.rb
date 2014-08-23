module ApplicationHelper
  # datetime: 整形対象の日付時刻値（Timeオブジェクト）
  # type: 出力形式（日付時刻 :datetime、日付のみ :date、年月 :year_month、年 :year、時刻のみ :time
  def format_datetime(datetime, type = :datetime)
    # 引数datetimeがnilの場合は空文字を返す
    return '' if datetime.nil?
    
    # 引数typeの値に応じて対応するフォーマット文字列をセット
    case type
    when :datetime
      format = '%Y-%m-%d %H:%M:%S'
    when :date
      format = '%Y-%m-%d'
    when :year_month
      format = '%Y-%m'
    when :year
      format = '%Y'
    when :time
      format = '%H:%M:%S'
    end
    
    # 指定されたフォーマットで日付時刻値を整形
    datetime.strftime(format)
  end
  
  # value: 値
  # certainty: 確率
  def expected_value(value, certainty)
    # 引数vakueがnilの場合は空文字を返す
    return '' if value.blank?|| certainty.blank?
    
    # 期待値を返す
    value.to_i * certainty.to_i / 100
  end
  
  # obj: オブジェクト
  # attr: 取り出したい属性
  def get_attribute(obj, attr)
    # 引数objがnilの場合は空文字を返す
    return '' if obj.blank?
    
    # 引数attributeを取り出す
    obj.attributes[attr.to_s]
  end
  
  # collection: 合計を求めたい属性を持つオブジェクトの集合
  # attr: 合計を求めたい属性
  def get_sum(collection, attr)
    # 引数collectionがnilの場合は0を返す
    return 0 if collection.blank?
    
    sum = 0
    collection.each do |obj|
      if !obj.attributes[attr.to_s].blank?
        sum += obj.attributes[attr.to_s].to_i
      end
    end
    return sum
  end
  
  # collectinoi: 期待値の総和を求めいたオブジェクトの集合
  def get_expected_sum(collection)
    sum = 0
    return sum if collection.blank?
    
    collection.each do |obj|
      if !obj.price.blank? && !obj.certainty.blank?
        sum += expected_value(obj.price, obj.certainty.name)
      end
    end
    return sum
  end
  
  # collection: SalesForecastのコレクション
  def forecast_statuses(collection)
    statuses = Status.pluck(:id, :name)
    status_count = Hash.new(0)
    
    collection.each do |sales_forecast|
      status_count[sales_forecast.status.id] += 1 unless sales_forecast.status.blank?
    end
    
    result = Array.new
    statuses.each do |status|
      result << [status[0], status[1], status_count[status[0]]] # status[0]: id、status[1]: name
    end
    
    return result
  end
  
  def forecast_segments(collection)
    segments = Segment.pluck(:id, :name)
    segment_count = Hash.new(0)
    
    collection.each do |sales_forecast|
      segment_count[sales_forecast.segment_id] += 1 unless sales_forecast.segment.blank?
    end
    
    result = Array.new
    segments.each do |segment|
      result << [segment[0], segment[1], segment_count[segment[0]]]
    end
    
    return result
  end
  
  def pagination(current_page, num_of_pages, args={})
    str = "<li>"
    str += link_to "<<", args.merge({:page => current_page, :page_to => :desc})
    str += "</li>\n"
    (1..num_of_pages).each do |page|
      str += "<li"
      if page == current_page
        str += " class='active'"
      end
      str += ">"
      str += link_to page, args.merge({:page => page})
      str += "</li>\n"
    end
    str += "<li>"
    str += link_to ">>", args.merge({:page => current_page, :page_to => :asc})
    str += "</li>\n"
    return str
  end
end
