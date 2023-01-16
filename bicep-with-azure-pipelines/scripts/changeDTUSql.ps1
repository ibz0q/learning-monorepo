Param(
    [ValidateSet(50, 100)]
    [Parameter(Mandatory = $true)]
    [Int]
    $DTU = 50,

    [String]
    [Parameter(Mandatory = $true)]
    $ResourceGroupName,

    [String]
    [Parameter(Mandatory = $true)]
    $ServerName,

    [String]
    [Parameter(Mandatory = $true)]
    $ElasticPoolName,

    [String]
    [Parameter(Mandatory = $true)]
    $ApplicationId,

    [String]
    [Parameter(Mandatory = $true)]
    $TenantId,
    
    [String]
    [Parameter(Mandatory = $true)]
    $ClientSecret,

    [Int]
    [Parameter(Mandatory = $true)]
    $DatabaseDtuMax,

    [Int]
    [Parameter(Mandatory = $true)]
    $DatabaseDtuMin
)

Begin {

    Try {
        $AzurePassword = ConvertTo-SecureString -String $ClientSecret -AsPlainText -Force
        $Credential = New-Object System.Management.Automation.PSCredential($ApplicationId , $AzurePassword)
   
        $ConnectionObject = Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantId
    }
    Catch {
        Write-Output "Issue with authenication" $_
    }
} Process {

    Try {
        Set-AzSqlElasticPool -ResourceGroupName $ResourceGroupName -ServerName $ServerName -ElasticPoolName $ElasticPoolName -Dtu $Dtu -DatabaseDtuMax $DatabaseDtuMax -DatabaseDtuMin $DatabaseDtuMin
    }
    Catch {
        Write-Output "Could not resize SQL elastic pool" $_
    }

} End { 

    Disconnect-AzAccount
}
