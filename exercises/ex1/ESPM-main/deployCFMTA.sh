rm mta.yaml
cds add mta --force
sed -i 's/nodejs_buildpack/nodejs_buildpack\r      memory: 64MB/g' mta.yaml
cds build --production
npm i
mbt build -t ./
cf deploy ESPM_1.0.0.mtar
