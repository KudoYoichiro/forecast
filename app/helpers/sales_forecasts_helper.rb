module SalesForecastsHelper
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
    return '' if value.nil?
    
    # 期待値を返す
    number_with_delimiter(value * certainty / 100)
  end
  
  # obj: オブジェクト
  # attr: 取り出したい属性
  def get_attribute(obj, attr)
    # 引数objがnilの場合は空文字を返す
    return '' if obj.nil?
    
    # 引数attributeを取り出す
    obj.attributes[attr.to_s]
  end
end
