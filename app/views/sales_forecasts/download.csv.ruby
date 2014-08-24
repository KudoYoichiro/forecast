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
result << "代理店" + ","
result << "状況" + ","
result << "担当"
result << "\r"
@sales_forecasts.each do |forecast|
	if forecast.service_center.blank?
		result << ","
	else
		result << forecast.service_center.name + ","
	end
	result << forecast.segment.name + ","
	result << forecast.status.name + ","
	result << forecast.area.name + ","
	result << forecast.company + ","
	result << forecast.division + ","
	result << forecast.customer_name + ","
	result << forecast.instrument + ","
	result << forecast.price.to_s + ","
	result << forecast.budget.name + ","
	result << (forecast.certainty.name / 100.0).to_s + ","
	result << forecast.agent + ","
	result << forecast.condition_text + ","
	result << forecast.person_in_charge
	result << "\r"
end

result