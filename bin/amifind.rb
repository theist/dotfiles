#!/usr/bin/env ruby
res = `curl -s 'https://cloud-images.ubuntu.com/locator/ec2/releasesTable' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36' -H 'Accept: application/json, text/javascript, */*' -H 'Referer: https://cloud-images.ubuntu.com/locator/ec2/' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive'`

rows = res.split(/\n/)

rows.pop
rows.pop

rows.shift
rows.shift

clean = rows.map { |x| x.gsub(/<.[^>]+>/,"").gsub(/"/,"").gsub(/,$/,"").gsub(/\[|\]/,"") }

puts clean.join("\n")
