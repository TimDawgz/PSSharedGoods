# not sure why I have it, or where it's used. Need to find out
function Find-UsersProxyAddressesStatus {
    param(
        $User
    )
    $status = 'No proxy'
    if ($null -ne $user.proxyAddresses) {
        $count = 0
        foreach ($proxy in $($user.ProxyAddresses)) {
            if ($proxy.SubString(0, 4) -ceq 'SMTP') { $count++ }
        }
        if ($count -eq 0) {
            $status = 'Missing primary proxy'
        } elseif ($count -gt 1) {
            $status = 'Multiple primary proxy'
        } else {
            $status = 'All OK'
        }
    } else {
        $status = 'Missing all proxy'
    }
    return $status
}