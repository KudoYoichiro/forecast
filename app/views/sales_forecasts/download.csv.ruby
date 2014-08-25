require 'kconv'

result = ''
result << "sc" + ","
result << "客層" + ","
result << "状態" + ","
result << "地域" + ","
result << "顧客" + ","
result << "部署" + ","
result << "氏名" + ","
result << "機種" + ","
result << "金額" + ","
result << "予算" + ","
result << "確度" + ","
result << "発注時期" + ","
result << "代理店" + ","
result << "状況" + ","
result << "担当"
result << "\r"
@sales_forecasts.each do |forecast|
	result << forecast.service_center.name unless forecast.service_center.blank?
	result << ","
	result << forecast.segment.name unless forecast.segment.blank?
	result << ","
	result << forecast.status.name unless forecast.status.blank?
	result << ","
	result << forecast.area.name unless forecast.area.blank?
	result << ","
	result << forecast.company + ","
	result << forecast.division + ","
	result << forecast.customer_name + ","
	result << forecast.instrument + ","
	result << forecast.price.to_s + ","
	result << forecast.budget.name unless forecast.budget.blank?
	result << ","
	result << (forecast.certainty.name / 100.0).to_s unless forecast.certainty.blank?
	result << ","
	result << forecast.order_date + ","
	result << forecast.agent + ","
	result << forecast.condition_text.gsub(/[\r\n]/, "").gsub(/,/, "、") + ","
	result << forecast.person_in_charge
	result << "\r"
end

result.kconv(Kconv::SJIS, Kconv::UTF8)