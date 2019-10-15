
@echo off 

:: Just Installing VIM for the Win(dows)
 
setlocal enabledelayedexpansion

  :: VIM
      mkdir !HOME!\.vim
      xcopy /E/H * ..\.vim\
