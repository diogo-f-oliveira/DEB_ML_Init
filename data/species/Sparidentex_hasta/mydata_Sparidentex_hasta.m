function [data, auxData, metaData, txtData, weights] = mydata_Sparidentex_hastaSparidentex_hasta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Sparidentex_hasta'; 
metaData.species_en = 'Sobaity seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 30];

%% set data
% zero-variate data

data.am = 11*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MathSamu1990';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 83;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp  = 422; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.01413*Lp^3.03, see F1';
data.Wwi = 9225; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^3.03, see F1';
  
data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(26.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthopagrus_berda'; 

% univariate data
% time-length
data.tL = [ ... % years class (d), total length (cm)
0.526	13.473
0.563	12.929
0.582	11.839
0.596	16.203
0.611	19.294
0.615	15.113
0.628	20.204
0.661	23.296
0.666	18.205
0.721	16.753
0.724	13.662
0.735	21.117
0.752	22.209
0.768	24.573
0.776	15.118
0.790	19.846
0.792	17.483
0.966	23.489
1.039	22.583
1.053	27.310
1.056	23.674
1.071	26.220
1.376	27.140
1.506	41.690
1.528	37.146
1.541	43.146
1.544	39.510
1.565	36.238
1.567	33.875
1.621	33.513
1.622	32.967
1.626	28.968
1.638	35.332
1.647	24.968
1.671	38.060
1.681	27.697
1.695	31.516
1.704	42.061
1.705	40.061
1.708	37.152
1.737	45.335
1.745	35.517
1.746	34.245
1.784	32.428
1.908	54.796
1.935	23.706
1.938	41.161
1.960	36.616
1.980	34.071
2.012	38.436
2.133	43.168
2.197	52.806
2.247	36.990
2.297	41.174
2.309	47.901
2.311	45.538
2.366	43.540
2.478	59.362
2.479	57.726
2.486	50.453
2.499	55.727
2.521	51.909
2.524	48.091
2.555	53.729
2.623	58.277
2.632	48.095
2.643	35.186
2.648	50.459
2.664	52.460
2.694	39.188
2.695	37.370
2.719	50.644
2.728	40.826
2.742	65.372
2.812	47.193
2.891	59.195
2.933	52.470
2.947	57.379
2.952	51.379
2.954	48.834
3.036	57.201
3.038	55.019
3.060	50.656
3.080	48.839
3.080	48.657
3.083	45.566
3.092	55.566
3.093	53.930
3.094	52.839
3.102	44.294
3.104	62.294
3.144	57.386
3.163	56.114
3.497	64.672
3.499	62.127
3.797	70.501
3.951	58.325
3.962	66.507
3.963	65.234
3.994	69.963
4.042	56.692
4.186	56.697
4.789	65.264
4.793	80.355
4.816	74.720
4.894	67.995
4.932	65.270
5.428	72.924
5.689	82.570
5.711	77.298
5.770	72.027
5.779	81.664
5.780	80.573
5.858	73.667
5.867	64.395
5.870	60.213
5.881	68.940
5.891	77.304
6.107	77.130
6.524	72.418
6.829	72.066
6.849	70.430
7.010	71.163
7.315	70.993
7.399	76.996
7.402	74.087
7.775	78.646
8.517	71.400
8.686	83.952
8.729	75.226
9.467	73.435
10.345	75.466];    
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(26.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MathSamu1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01413*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Protandrous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6YVD2'; % Cat of Life
metaData.links.id_ITIS = '647981'; % ITIS
metaData.links.id_EoL = '46580028'; % Ency of Life
metaData.links.id_Wiki = 'Sparidentex'; % Wikipedia
metaData.links.id_ADW = 'Sparidentex_hasta'; % ADW
metaData.links.id_Taxo = '187871'; % Taxonomicon
metaData.links.id_WoRMS = '218626'; % WoRMS
metaData.links.id_fishbase = 'Sparidentex-hasta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sparidentex}}';
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
bibkey = 'MathSamu1990'; type = 'Article'; bib = [ ... 
'author = {C.P. Mathews and M. Samuel},'...
'title = {The relationship between maximum and asymptotic length in fishes},'...
'journal = {Fishbyte : }, '...
'volume = {8(2)}, '...
'pages = {14-16}, ' ...
'year = {1990}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sparidentex-hasta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
