require 'petfinder'
require 'csv'
require 'active_interaction'

module Utils
  class PetfinderContactGenerator < ActiveInteraction::Base

    def execute
      get_emails
    end

    private

    def client
      @client ||= Petfinder::Client.new(
        'M8gZNDfg8CH2pIOl83caEpmSTzVuCfqefaUfoJiDBk0tWY5Bh1',
        'vQoLl80w7Fjw6MOaxivtxdG85yBo7JxB5SUmjRqt'
      )
    end

    def total_pages
      @total_pages ||= results.last['total_pages']
    end

    def results
      @results ||= JSON.parse(client.organizations(limit: 100).to_json)
    end


    def organization(id)
      client.organization(id)
    end

    def get_emails
      page_count = total_pages
      file_name = "petfinder_emails.csv"

      headers = ['Rescue Name', 'Email Contact']

      CSV.open(file_name, 'w', write_headers: true, headers: headers) do |csv|
        page_count.times do |n|
          next if n == 0

          result = client.organizations(limit: 100, page: n)
          p result
          result.each do |r|
            r.each do |org|
              next unless org.is_a?(Hash)
              csv << [org.name, org.email]
            end
          end
        end
      end
    end

  end
end
