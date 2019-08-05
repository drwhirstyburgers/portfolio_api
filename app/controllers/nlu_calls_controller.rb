class NluCallsController < ApplicationController
    require "google/cloud/language"
    include DeriveText

    def create
        @nlu_call = NluCall.new
        language = Google::Cloud::Language.new
        @nlu_call.url = params[:url]

        text = DeriveText.get_content(@nlu_call.url)

        response = language.analyze_entities content: text, type: :PLAIN_TEXT

        @nlu_call.response = response.entities

        if @nlu_call.save!
            respond_to do |format|
                format.json @nlu_call.response
            end
        end
    end
end
