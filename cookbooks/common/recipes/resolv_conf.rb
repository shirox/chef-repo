file "/etc/resolv.conf" do
  content "nameserver 8.8.8.8"
  mode "0644"
  owner "root"
  group "root"
end
