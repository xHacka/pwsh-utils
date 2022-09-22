function OpenExplorerAtCurrentDirectory { 
    if ($args[0]) { explorer $args[0] }
    else { explorer (Get-Location) }
}
