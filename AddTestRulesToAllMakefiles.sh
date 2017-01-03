filename="Makefile.PL"
ls -d */ | cut -f1 -d'/' | while read foldername
do
  if [ -a $foldername/$filename ];then
    pattern="^test.*:.*makefile$"
    replacestring="test unit_test integration_test regression_test test_coverage collect_coverage coverage_report critic_report sonar_reports sonar_properties sonar_scan: makefile"
    if ! grep --quiet "$replacestring" $foldername/$filename; then
        echo "Changed $foldername/Makefile.PL."
    	sed -i -e "s/$pattern/$replacestring/" $foldername/$filename
    fi
  fi
done

