# Check with AWS US IP.
describe command('curl -H "X-Forwarded-For: 129.33.160.1" -I localhost/block') do
    its('stdout') { should match /200 OK/ }
    its('exit_status') { should eq 0 }
end
