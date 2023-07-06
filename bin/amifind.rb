#!/usr/bin/env ruby

require "json"

res = `curl -s 'https://cloud-images.ubuntu.com/locator/ec2/releasesTable' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36' -H 'Accept: application/json, text/javascript, */*' -H 'Referer: https://cloud-images.ubuntu.com/locator/ec2/' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive'`

arr = JSON.parse(res)["aaData"]
arr.map! {|x| x.join(",") }
arr.map! { |x| x.gsub("</a>", "")}
arr.map! { |x| x.gsub(/,<a .*>/, ",")}


puts arr.join("\n")
