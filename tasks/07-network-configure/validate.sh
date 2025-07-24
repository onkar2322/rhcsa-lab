#!/bin/bash

echo "Validating Task 07: Configure Network and Set Static Hostname"
echo "-------------------------------------------------------------"

# Expected values
IP_EXPECTED="172.25.250.10"
GATEWAY_EXPECTED="172.25.250.254"
DNS_EXPECTED="172.25.250.254"
HOSTNAME_EXPECTED="alpha.domain1.example.com"

# Initialize result flag
all_pass=true

# Check hostname
current_hostname=$(hostname)
if [[ "$current_hostname" == "$HOSTNAME_EXPECTED" ]]; then
    echo "✅ Hostname is correctly set to $current_hostname"
else
    echo "❌ Hostname is '$current_hostname' (Expected: $HOSTNAME_EXPECTED)"
    all_pass=false
fi

# Check IP address
ip_found=$(ip -4 addr show | grep -w "$IP_EXPECTED")
if [[ -n "$ip_found" ]]; then
    echo "✅ IP address is correctly set to $IP_EXPECTED"
else
    echo "❌ IP address is not correctly set (Expected: $IP_EXPECTED)"
    all_pass=false
fi

# Check Gateway
current_gateway=$(ip route | grep default | awk '{print $3}')
if [[ "$current_gateway" == "$GATEWAY_EXPECTED" ]]; then
    echo "✅ Gateway is correctly set to $current_gateway"
else
    echo "❌ Gateway is '$current_gateway' (Expected: $GATEWAY_EXPECTED)"
    all_pass=false
fi

# Check DNS
dns_found=$(grep -w "$DNS_EXPECTED" /etc/resolv.conf)
if [[ -n "$dns_found" ]]; then
    echo "✅ DNS is correctly set to $DNS_EXPECTED"
else
    echo "❌ DNS is not correctly set (Expected: $DNS_EXPECTED)"
    all_pass=false
fi

# Final status
if $all_pass; then
    echo -e "\n🎉 All checks passed. Task completed successfully."
else
    echo -e "\n⚠️ Some checks failed. Please review and try again."
fi

