# Show Package Tool

- https://support.checkpoint.com/results/sk/sk120342
- https://github.com/CheckPointSW/ShowPolicyPackage

## Help

```bash
[Expert@CPSMS:0]# $FWDIR/scripts/web_api_show_package.sh -h

show-package version: v2.3.0


web_api_show_package.sh optional-switches

optional-switches:
---------------
[-m server-IP]
        Management server ip address.
        Default value is {127.0.0.1}.
[-n port-number]
        Port of WebAPI server on management server.
        Default {443}.
[-g gateway-name]
        Gateway name.
        Shows the policy packages which are installed on this gateway.
[-u user-name]
        Management administrator user name.
[-p password]
        Management administrator password.
[--api-key API key]
        Management administrator API key.
[--cloud-mgmt-id Smart-1 Cloud management UID]
        Smart-1 Cloud management UID.
[-d domain-name]
        Name, uid or IP-address of the management domain.
[-b]
        UNSAFE! Ignore certificate verification.
        Default {false}
[-r]
        Keep show package temporary folder.
[-o path]
        Result path.
        Path where to store the result tar file.
        Or path with .tar.gz suffix in order to set tar file name.
        The default is the current directory.
[-k package-name]
        Package name.
        The policy package to show.
[-v]
        List the existing policy packages.
[-c]
        Show Access Policy rules hit counts.
        Default {false}
[--show-rule-uid]
        Show Each rule's UID.
        Default {false}
[--query-limit limit]
        No more than that many results will be returned on each call.
        Increase the limit to get a faster execution (because of less number of calls in total)
        Decrease the limit when your calls are hitting the timeout (e.g. when your rulebase is huge and complex)
        The limit must be in range from 1 to 500
        Default {10}
[--show-membership (true|false)]
        Whether to calculate groups membership for the objects ("groups" field)
        This flag is supported from R80.10 Jumbo HF take 70
[--dereference-group-members (true|false)]
        Whether to dereference group members.
        This flag is supported from R80.10 Jumbo HF take 70
[-x proxy-settings]
        Proxy settings example: user:password@proxy.server:port
[-s]
        Minimal debug information.
[--version]
        Print version and exit.
[-h]
        Usage guide.
[--published-session-uid published session uid]
        Show package as of the input published session. If not specified, will show the last published package
[--show-access-policy  (true|false)]
        Indicates whether to show access policy as part of policy package. Default value is True.
[--show-threat-policy  (true|false)]
        Indicates whether to show threat policy as part of policy package. Default value is True.
[--show-nat-policy  (true|false)]
        Indicates whether to show NAT policy as part of policy package. Default value is True.
[--show-https-policy  (true|false)]
        Indicates whether to show HTTPS policy as part of policy package. Default value is True.

[Expert@CPSMS:0]#

```
