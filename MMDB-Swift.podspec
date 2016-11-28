Pod::Spec.new do |s|
  s.name         = "MMDB-Swift"
  s.version      = "0.2.1"
  s.summary      = "A wrapper for MaxMind DB"
  s.description  = <<-DESC
                   A tiny wrapper for libmaxminddb which allows you to lookup
                   Geo data by IP address.
                   DESC

  s.homepage     = "https://github.com/lexrus/MMDB-Swift"

  s.license      = { :type => "APACHE 2.0", :file => "LICENSE" }

  s.author             = { "Lex Tang" => "lexrus@gmail.com" }
  s.social_media_url   = "https://twitter.com/lexrus"

  s.platform     = :ios, :osx

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/lexrus/MMDB-Swift.git",
                     :tag => s.version }

  s.source_files  = "Sources/MMDB.swift", "MMDB/maxminddb*.{h,c}"
  s.public_header_files = "MMDB/maxminddb*.h", "MMDB-iOS/MMDB.h"

  s.resource  = "MMDB/GeoLite2-Country.mmdb"

  s.framework  = "Foundation"
  s.requires_arc = true

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'MMDB_UINT128_IS_BYTE_ARRAY'
  }
end
