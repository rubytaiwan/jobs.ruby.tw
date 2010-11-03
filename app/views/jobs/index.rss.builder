xml.instruct! :xml, :version => "1.0"
xml.rss "version" => "2.0" do
  xml.channel do
    xml.title "Ruby Jobs in Taiwan"
    xml.link jobs_url
    xml.description "Ruby Jobs in Taiwan"
 
    @jobs.each do |job|
      xml.item do
        xml.title job.title
        xml.link job_url(job)
        xml.description job.description
        xml.pubDate job.created_at.to_s(:rfc822)
      end
    end
  end
end