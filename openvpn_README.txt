A note on the vpn-mullvad container:

The container lookes for openvpn configs in its own /vpn directory which is linked to the real /etc/openvpn.
As such, and configs need to be edited to do two things:

1 - Disable ipv6.

	From https://mullvad.net/en/help/linux-openvpn-installation/:
	
	I have disabled IPv6 and OpenVPN exits with a fatal error.

	Edit the OpenVPN configuration and make the following changes:

		replace proto udp with proto udp4.
    		replace proto tcp with proto tcp4.
    		add pull-filter ignore "route-ipv6"
    		add pull-filter ignore "ifconfig-ipv6"

2 - Change the location of the "up" and "down" scripts.

	replace up=/etc/openvpn/update-resolv-conf with up=/vpn/update-resolv-conf
        replace down=/etc/openvpn/update-resolv-conf with down=/vpn/update-resolv-conf
