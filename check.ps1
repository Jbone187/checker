## Universal TokenChecker Test Tool


function Menu(){

    Write-Host ""

    Write-Host "Universal TokenChecker"
    Write-Host "------------------------------------------------------------------"

    Write-Host ""

    Write-Host "1. Vantiv ECH1 Echo - ECH1 (Tokenize) - TokenEchoFin"
    Write-Host "2. Vantiv ChargeBack - UHAU_P0BCD71D - (Tokenize) - VantivChargeback"
    Write-Host "3. AMEX INQ - UHAULPRD.INQ02#... (Tokenize) - AmexInquiry"
    Write-Host "4. Discover Settlement Send - Discover.dat (Detokenize) - Detokenize"
    Write-Host "5. AMEX Settlement Send - UHAULPRD.SETTLEMENT.098671 (Detokenize) - Detokenize"
    Write-Host "6. AMEX EPTRN - UHAULPRD.EPTRN#... (Tokenize) - TokenAmexRpt"
    Write-Host "7. Discover ANRRPT N04 - DISCANR-1.dat (Tokenize) - TokenDiscoverRpt"
    Write-Host "8. Discover ANRRPT N11 - DISCANR-2.dat (Tokenize) - TokenDiscoverRpt"
    Write-Host "9. Discover FILECONF N04 - DISCECHO-1.dat (Tokenize) - TokenDiscoverRpt"
    Write-Host "10. Discover FILECONF N11 - DISCECHO-2.dat (Tokenize) - TokenDiscoverRpt"
    Write-Host "11. AMEX CBNOT - UHAULPRD.CBNOT# (Tokenize) - AmexChargeback"
   
    Write-Host ""

   $global:checkerSettings = Read-Host -Prompt "Please Select Setting"


};
Menu

function UniversalTokenizer(){

    if($global:checkerSettings -eq "1"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *ECH1* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m TokenEchoFin', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *ECH1* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *ECH1*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose
    }

    elseif($global:checkerSettings -eq "2"){
         
         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAU_P0BCD71D_* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m VantivChargeback', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAU_P0BCD71D_* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *UHAU_P0BCD71D_*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose


    }

    elseif($global:checkerSettings -eq "3"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.INQ02* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m AmexInquiry', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.INQ02* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *UHAULPRD.INQ02*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

    elseif($global:checkerSettings -eq "4"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *Discover* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m Detokenize', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *Discover* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *Discover*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

    elseif($global:checkerSettings -eq "5"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.SETTLEMENT.098671* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m Detokenize', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.SETTLEMENT.098671* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *UHAULPRD.SETTLEMENT.098671*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

     elseif($global:checkerSettings -eq "6"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.EPTRN* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m TokenAmexRpt', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.EPTRN* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *UHAULPRD.EPTRN*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

     elseif($global:checkerSettings -eq "7"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCANR-1* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m TokenDiscoverRpt', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCANR-1* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *DISCANR-1*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

     elseif($global:checkerSettings -eq "8"){

        $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCANR-2* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m TokenDiscoverRpt', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCANR-2* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *DISCANR-*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

     elseif($global:checkerSettings -eq "9"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCECHO-1* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m TokenDiscoverRpt', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCECHO-1* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *DISCECHO-1*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

     elseif($global:checkerSettings -eq "10"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCECHO-2* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m TokenDiscoverRpt', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *DISCECHO-2* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *DISCECHO-2*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }

    
     elseif($global:checkerSettings -eq "11"){

         $UntokenFile = Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.CBNOT* -Recurse

         $path_tokenizefile_input = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $UntokenFile
         $path_tokenizefile_output = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $UntokenFile + "#"

         Start-Process -Wait -FilePath 'C:\UTC_UniversalTokenizer\UniversalTokenizer.exe' -ArgumentList '-m AmexChargeback', "`"$path_tokenizefile_input`"", "`"$path_tokenizefile_output`""

         $file1 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\' -Filter *UHAULPRD.CBNOT* 
         $file2 =  Get-ChildItem 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' -Filter *UHAULPRD.CBNOT*
         
         $oldFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\' + $file1
         $newFile = 'D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\' + $file2 
           
         & 'C:\Program Files (x86)\WinMerge\WinMergeU.exe' /s /u /wl /wr /dl "$newFile - Tokenized" /dr "$oldFile - UnTokenized" $newFile $oldFile

         Start-Sleep -Seconds 3

         Get-ChildItem -Path D:\Scripts\Universal_TokenChecker_Stage_Files\tmp_files\ -File | Remove-Item -Verbose

    }
    
    else {

         Write-Host "Not Correct Setting"
    }

};
UniversalTokenizer
