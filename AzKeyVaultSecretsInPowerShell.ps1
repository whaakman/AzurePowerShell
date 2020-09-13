$keyvaultName = 'KeyVaultName'
# Retrieves all secrets from the KeyVaults
$secrets = Get-AzKeyVaultSecret -VaultName $keyvaultName

# Stores all secrets in Array $Keys
$keys =@{}
foreach ($secret in $secrets)
    {
        $secretName = $secret.name
        
        $key = (Get-AzKeyVaultSecret -VaultName $keyvaultName -name $secretName).SecretValueText
        $keys.Add("$secretName", "$key")
    }

# Refernce keys as $keys.SecretName