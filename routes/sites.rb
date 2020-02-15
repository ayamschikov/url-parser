# frozen_string_literal: true

class App
  plugin :path
  path :sites, '/sites'

  route 'sites' do |r|
    r.post do
      SiteService.upload_sites_by_urls(r.params['urls'])

      'Parsed'
    end
  end
end
