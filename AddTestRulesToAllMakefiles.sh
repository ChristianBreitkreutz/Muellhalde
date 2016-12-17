function addToMakefile {
    if ! grep --quiet "$1[: ]" $cartridgename/Makefile.PL; then
      echo "add $1 to $cartridgename/Makefile.PL."
      sed -i -e "s/coverage_report/$1 coverage_report/" $cartridgename/Makefile.PL
    fi
    if ! grep --quiet "$1[: ]" $cartridgename/Makefile.PL; then
      echo "$cartridgename/Makefile.PL dont contain $1 section"
    fi
}

ls -d */ | cut -f1 -d'/' | while read cartridgename
do
  if [ -a $cartridgename/Makefile.PL ];then
    # init 
    if ! grep --quiet "coverage_report[: ]" $cartridgename/Makefile.PL; then
      echo "add coverage_report to $cartridgename/Makefile.PL"
      sed -i -e 's/test: makefile/test coverage_report: makefile/' $cartridgename/Makefile.PL
    fi
    if ! grep --quiet "$1[: ]" $cartridgename/Makefile.PL; then
      echo "$cartridgename/Makefile.PL dont contain $1 section"
    fi
    # all others
    addToMakefile "regression_test"
    addToMakefile "test_coverage"
    addToMakefile "collect_coverage"
    addToMakefile "unit_test"
    addToMakefile "integration_test"
    addToMakefile "sonar_report"
  fi
done
