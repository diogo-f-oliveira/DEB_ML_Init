function [data, auxData, metaData, txtData, weights] = mydata_Ctenochaetus_striatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Ctenochaetus_striatus'; 
metaData.species_en = 'Striated surgeonfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.am = 35*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChoaAxe1996';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 8.58; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length, compared to Zebrasoma_scopas';
data.Li  = 26;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Leis1989';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 30; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on g = 3.517e-5 * (10*Lp)^3.066, see F1';
data.Wwi = 892; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 3.517e-5 * (10*Li)^3.066, see F1';

data.Ri  = 2.9e4/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Ri for Zebrasoma_scopas as fraction of Wwi';

% uni-variate data
% time-length data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.127	11.752
0.383	11.086
0.387	12.140
0.553	10.477
0.732	12.417
0.736	13.359
0.736	13.470
0.900	11.086
0.901	11.419
0.903	11.752
1.508	12.195
1.595	12.528
1.763	11.142
1.769	13.137
1.772	13.914
2.026	12.417
2.114	12.916
2.116	13.636
2.799	11.585
2.817	16.962
2.896	14.911
2.899	15.632
2.978	13.636
2.981	14.412
2.984	15.244
3.066	14.191
3.674	15.576
3.840	13.470
3.841	13.914
3.844	14.690
4.006	11.752
4.105	15.576
4.878	14.523
4.969	16.131
4.971	16.519
5.052	15.078
5.233	17.517
5.481	14.523
5.662	17.073
5.823	13.747
5.912	14.412
5.915	15.355
5.917	15.965
5.920	16.741
6.177	16.408
6.433	15.576
6.871	17.572
7.122	15.466
7.207	15.078
7.468	15.854
7.980	14.135
8.072	15.743
9.112	17.406
9.702	13.636
9.789	13.692
9.963	14.357
10.055	15.909
10.057	16.574
10.059	17.129
10.138	15.133
10.823	13.525
11.088	15.521
11.090	16.075
11.092	16.741
11.269	17.960
11.785	17.517
11.853	12.306
11.958	17.960
12.030	13.747
12.118	14.302
12.120	14.745
12.811	15.299
12.980	14.080
12.981	14.523
13.339	18.404
13.849	16.186
14.372	17.738
14.795	15.410
14.801	17.239
14.885	16.630
14.968	15.798
14.974	17.572
14.976	17.905
15.740	14.579
15.999	14.800
16.867	16.353
16.949	15.244
17.040	16.685
17.041	17.018
17.810	14.856
17.993	17.849
19.969	16.131
19.971	16.519
19.971	16.630
20.047	13.636
20.919	16.463
21.083	14.191
21.188	19.623
24.195	16.408
24.203	19.013
25.235	18.016
25.924	17.905
26.950	15.466
27.984	15.466
28.844	14.634
29.198	17.350
35.134	13.858];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChoaAxe1996';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 3.517e-5 * (SL in mm)^3.066';
metaData.bibkey.F1 = 'ChoaAxe1996'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '325C3'; % Cat of Life
metaData.links.id_ITIS = '172308'; % ITIS
metaData.links.id_EoL = '46577096'; % Ency of Life
metaData.links.id_Wiki = 'Ctenochaetus_striatus'; % Wikipedia
metaData.links.id_ADW = 'Ctenochaetus_striatus'; % ADW
metaData.links.id_Taxo = '172382'; % Taxonomicon
metaData.links.id_WoRMS = '219659'; % WoRMS
metaData.links.id_fishbase = 'Ctenochaetus-striatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ctenochaetus_striatus}}';
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
bibkey = 'ChoaAxe1996'; type = 'Article'; bib = [ ... 
'author = {J. H. Choat and L. M. Axe}, ' ... 
'year = {1996}, ' ...
'title = {Growth and longevity in acanthurid fishes; an analysis of otolith increments}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {134}, ' ...
'pages = {15--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1262}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leis1989'; type = 'Article'; bib = [ ... 
'author = {Leis, J. M.}, ' ... 
'year = {1989}, ' ...
'title = {Larval biology of butterflyfishes ({P}isces, {C}haetodontidae): {W}hat do we really know?}, ' ...
'journal = {Envir. Biology of Fishes}, ' ...
'volume = {25}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
