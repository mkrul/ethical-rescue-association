require 'petfinder'

class Contacts

  def initialize
  end

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

  def emails
    page_count = total_pages
    file_count = 1
    file_name = "emails_#{file_count}.txt"
    emails = []
    page_count.times do |n|
      next if n == 0

      puts "page #{n} of #{page_count} ------------------------------------\n\n"
      result = client.organizations(limit: 100, page: n)
      result.each do |r|
        r.each do |org|
          next unless org.is_a?(Hash)
          emails << org.email
        end
      end
    end


    emails.uniq.each_slice(500) do |emails|
      File.open(file_name, 'w') do |f|
        f.write emails.join(',')
        file_count += 1
        file_name = "emails_#{file_count}.txt"
      end
    end
    p emails.uniq
  end

end