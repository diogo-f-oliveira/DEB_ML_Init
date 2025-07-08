function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_panamensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_panamensis'; 
metaData.species_en = 'Pacific graysby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(23.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(23.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 39;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 143;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01585*Lp^3.04, see F1';
data.Wwi = 1e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^3.04, see F1';

data.GSI = 0.017; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Eria2008';
  temp.GSI = C2K(23.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1.013	15.639
1.081	16.328
2.001	14.852
2.048	15.836
2.050	17.508
2.053	19.574
3.015	16.328
3.017	17.115
3.018	18.295
3.020	19.672
3.022	20.656
3.027	23.705
3.032	12.197
3.042	18.787
3.045	20.951
3.047	22.033
3.059	15.246
3.060	16.033
3.061	16.820
3.113	21.639
3.993	23.508
4.012	20.951
4.013	21.344
4.031	18.984
4.049	15.738
4.052	17.607
4.053	18.492
4.055	19.574
4.069	29.213
4.078	20.066
5.018	17.213
5.024	21.148
5.025	21.344
5.026	22.328
5.039	16.230
5.044	19.279
5.051	24.098
5.067	19.672
5.072	22.918
5.990	20.262
5.991	21.148
6.014	21.443
6.015	22.230
6.017	23.607
6.031	17.607
6.079	19.672
6.960	22.131
7.004	21.541
7.006	23.311
7.033	26.164
7.048	20.852
7.057	27.049
7.971	21.541
7.973	23.213
7.995	22.525
7.997	23.902
8.015	20.951
9.050	21.148
10.019	22.525
10.019	22.820
10.021	24.197
10.045	25.082
11.011	24.590
11.033	24.098
11.053	22.623
11.055	23.705
11.058	25.967
12.066	23.213
13.032	22.328
14.070	24.885];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(23.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CraiPond1999'; 
  
% length-weight
data.LW = [ ... % std length(cm), weight (g)
12.240	40.741
15.273	88.889
15.783	75.926
15.869	87.037
15.998	94.444
16.170	103.704
16.340	98.148
16.470	114.815
16.768	118.519
17.367	131.482
17.794	138.889
17.836	131.482
17.963	125.926
18.263	140.741
18.265	153.704
18.516	114.815
18.604	137.037
19.332	164.815
19.377	181.481
19.379	198.148
19.456	133.333
19.630	162.963
19.670	137.037
19.764	212.963
19.802	170.370
19.845	177.778
19.890	194.444
19.933	201.852
20.060	192.593
20.277	227.778
20.318	214.815
20.359	200.000
20.529	192.593
20.532	220.370
20.833	238.889
20.872	211.111
21.004	238.889
21.040	190.741
21.044	224.074
21.175	248.148
21.221	275.926
21.258	231.481
21.299	211.111
21.358	350.000
21.430	240.741
21.517	257.407
21.723	192.593
21.734	283.333
21.818	272.222
21.907	307.407
22.070	246.296
22.282	235.185
22.283	240.741
22.328	264.815
22.331	287.037
22.452	227.778
22.463	320.370
22.500	274.074
22.545	298.148
22.672	285.185
22.717	303.704
22.794	238.889
22.976	333.333
23.144	311.111
23.188	324.074
23.399	303.704
23.485	311.111
24.163	281.481
24.209	303.704
24.422	303.704
24.601	370.370
24.603	392.593
24.843	262.963
25.794	366.667
26.991	400.000
29.056	551.852];
units.LW   = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'CraiPond1999';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SDP2'; % Cat of Life
metaData.links.id_ITIS = '551028'; % ITIS
metaData.links.id_EoL = '46579789'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis_panamensis'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_panamensis'; % ADW
metaData.links.id_Taxo = '305520'; % Taxonomicon
metaData.links.id_WoRMS = '279152'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis-panamensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalopholis_panamensis}}';
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
bibkey = 'CraiPond1999'; type = 'Article'; bib = [ ... 
'author = {Matthew T. Craig and Daniel J. Pondella and John C. Hafner}, ' ... 
'year = {1999}, ' ...
'title = {ANALYSIS OF AGE AND GROWTH IN TWO EASTERN {P}ACIFIC GROUPERS ({S}ERRANIDAE: {E}PINEPHELINAE)}, ' ...
'journal = {BULLETIN OF MARINE SCIENCE}, ' ...
'volume = {65(3)}, ' ...
'pages = {807–814}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eria2008'; type = 'phdthesis'; bib = [ ... 
'author = {Erisman, Brad Edward}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive biology and evolution of epinephelid and serranid fishes ({P}erciformes, {E}pinephelidae, {S}erranidae)}, ' ...
'school = {UC San Diego}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cephalopholis-panamensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

