function [data, auxData, metaData, txtData, weights] = mydata_Erignathus_barbatus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Erignathus_barbatus'; 
metaData.species_en = 'Bearded seal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCim', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, Seal body temperature should be between 36.5-37.5 C
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Ana Sofia Aniceto', 'Starrlight Augustine'};    
metaData.date_subm = [2016 11 16];              
metaData.email    = {'asa@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 17];

%% set data
% zero-variate data

data.tg = 259;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 24;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'KovaLyde';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18-24 days' ;
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'AndeHjel1999';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'females';
data.am = 31*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Their longevity in captivity has not been studied in detail and hence their maximum longevity must be classified as unknown.';
  
data.Lb  = 1.3*1e2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KovaLyde';  
data.Lp  = 210;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AndeHjel1999'; 
  comment.Lp = 'authors say females are mature at 90% of the ultimate length as estimated from their von Bert curve';
data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KovaLyde';

data.Wwb = 35*1e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 75.75*1e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 400e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KovaLyde';

data.Ri  = 1/608;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr) , total length (cm)
0.045	134.082
0.015	155.737
3.027	190.372
2.973	196.709
3.999	186.952
3.970	198.307
6.018	195.165
3.939	225.243
4.938	219.975
4.965	216.278
4.965	213.901
5.988	218.668
6.015	212.594
7.011	219.474
6.981	240.072
7.952	243.254
7.900	238.764
8.977	236.665
8.953	223.725
9.948	235.886
9.977	218.985
10.947	225.071
10.922	220.318
10.975	215.301
11.942	238.817
11.969	236.441
11.943	233.535
11.918	226.141
11.945	222.180
12.967	232.493
13.021	225.891
12.997	213.215
14.017	233.035
14.018	228.017
13.939	224.847
14.990	219.843
14.961	238.329
14.986	242.554
16.955	238.883
18.032	234.672
0.020	122.198];  
data.tL(:,1) = data.tL(:,1) * 365; % day
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AndeHjel1999'; comment.tL = 'fig. 2 females';
  

% time - weight
data.tW = [ ... % time since birth (yr) , wet weight (kg) 
0	    35.421
0.917	101.005
3.984	187.167
9.908	300.238
12.949	322.380
11.900	285.370
10.904	269.524
13.893	257.804
13.945	242.988
11.874	211.297];   
data.tW(:,1) = data.tW(:,1) * 365; % day
data.tW(:,2) = data.tW(:,2) * 1e3; % g
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'}; 
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AndeHjel1999';
comment.tW = 'fig. 2 females';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = weights.Ri * 5; 
weights.Wwb = weights.Wwb * 2; 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'The sexes are not easily distinguished.';
metaData.bibkey.F1 = 'KovaLyde'; 
F2 = 'The total gestation time includes a 2 months period of delayed implantation.';
metaData.bibkey.F2 = 'AnAge';
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6H29T'; % Cat of Life
metaData.links.id_ITIS = '180655'; % ITIS
metaData.links.id_EoL = '46559154'; % Ency of Life
metaData.links.id_Wiki = 'Erignathus_barbatus'; % Wikipedia
metaData.links.id_ADW = 'Erignathus_barbatus'; % ADW
metaData.links.id_Taxo = '67428'; % Taxonomicon
metaData.links.id_WoRMS = '137079'; % WoRMS
metaData.links.id_MSW3 = '14001032'; % MSW3
metaData.links.id_AnAge = 'Erignathus_barbatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Bearded_seal}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Erignathus_barbatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KovaLyde'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.npolar.no/en/species/bearded-seal.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndeHjel1999'; type = 'Article'; bib = [ ... 
'author = {M. Andersen and A. M. Hjelset and I. Gjertz and C. Lydersen and B. Gulliksen}, ' ... 
'year = {1999}, ' ...
'title = {Growth, age at sexual maturity and condition in bearded seals (\emph{Erignathus barbatus}) from {S}valbard, {N}orway}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {21}, ' ...
'pages = {179--185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

