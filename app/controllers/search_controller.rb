class SearchController < ApplicationController

  def go
    search_field = params[:searchCriteria]
    value = params[:inputText]
    @contacts = Contact.find_by search_field.to_sym value
  end


end
