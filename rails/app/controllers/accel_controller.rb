class AccelController < ApplicationController
  def show
    request.headers.select do |key, _|
      key =~ /^HTTP_/
    end.each do |key, value|
      Rails.logger.debug "#{key}: #{value}"
    end

    send_file("/var/www/images/#{params[:filename]}", type: 'image/png', disposition: "inline")
  end
end
