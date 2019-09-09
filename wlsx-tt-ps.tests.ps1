

Describe "User API (live)" {
    It "Should return an object with properties 'user' and 'token'" {
        Invoke-Restmethod https://wlsx-tt-ps.azurewebsites.net/api/user
    }
}
