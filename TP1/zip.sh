rm -rf ISTP1.zip
cd src/
make clean-all
cd ..
echo 'Compiling report...'
make -C report/
cp report/report.pdf .
echo 'Creating delivery zip...'
zip ISTP1.zip -r -0  failed/ src/ output/ lib/ config.xml report.pdf
rm report.pdf