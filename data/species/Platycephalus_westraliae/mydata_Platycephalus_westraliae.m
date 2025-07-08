function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_westraliae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_westraliae'; 
metaData.species_en = 'Bartail flathead'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 04];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2017';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 55.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.9 mm of P. inidicus: pi/6*0.09^3'; 
data.Wwi = 2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'CoulHall2017';   
  temp.GSI = C2K(22);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	8.452
0.001	8.748
0.395	6.777
0.658	7.831
0.788	33.975
0.789	10.852
0.920	29.288
0.921	19.011
0.922	16.291
0.923	14.779
0.924	14.024
0.925	6.014
1.053	22.938
1.054	22.032
1.055	17.498
1.184	34.574
1.185	20.216
1.316	32.305
1.317	11.146
1.447	28.071
1.447	17.794
1.448	12.807
1.579	36.079
1.579	30.185
1.711	16.883
1.842	22.927
1.843	21.113
1.844	19.602
1.974	38.038
1.975	26.703
2.237	31.384
2.238	28.815
2.368	46.344
2.369	25.790
2.500	50.272
2.501	33.949
2.632	40.900
2.633	37.272
2.763	30.167
2.895	43.314
2.896	38.931
2.897	31.223
3.158	48.297
3.288	33.182
3.289	35.600
3.421	44.364
3.422	33.935
3.553	36.200
3.684	50.858
3.685	40.884
3.816	54.181
3.817	52.519
3.818	32.418
3.947	46.925
3.948	39.217
4.211	47.828
4.212	45.863
4.213	37.248
4.214	34.981
4.342	53.569
4.343	43.141
4.344	35.735
4.474	55.229
4.475	52.811
4.737	49.331
4.738	33.160
4.739	38.752
5.000	42.224
5.001	40.864
5.132	37.235
5.133	36.177
5.263	53.857
5.264	51.439
5.265	46.905
5.266	39.500
5.395	57.482
5.396	57.029
5.526	48.412
5.658	52.642
5.659	47.201
5.789	54.756
5.921	43.721
5.922	41.757
6.053	49.916
6.184	39.032
6.316	52.179
6.447	58.676
6.448	57.013
6.579	59.732
6.842	54.589
7.105	48.389
8.026	53.664
8.816	57.431
8.817	61.360];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2017';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.132	4.221
0.263	2.864
0.395	8.442
0.526	10.101
0.658	18.693
0.659	13.417
0.788	15.678
0.789	7.085
0.921	22.613
0.922	17.337
0.923	13.869
0.924	10.251
1.053	24.121
1.184	14.623
1.185	11.910
1.186	4.824
1.579	25.779
1.842	30.000
1.843	19.899
1.844	16.281
1.974	32.261
1.975	28.492
2.105	25.779
2.106	20.804
2.237	26.985
2.632	23.216
2.763	32.412
2.764	30.302
3.158	32.714
3.159	28.040
3.289	25.628
3.421	25.025
3.553	26.533
3.684	28.643
3.816	31.055
4.342	33.920
4.474	36.633
4.475	31.960
4.476	27.437
4.477	26.533
4.737	29.849
4.868	33.769
4.869	28.643
5.132	27.588
5.263	33.015
5.526	30.754
6.053	29.548
6.184	34.070
6.316	31.960
6.579	31.055
6.842	35.427
6.974	33.618
7.105	33.015
7.237	37.236
7.500	37.236
7.501	29.397
8.816	32.864];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHall2017';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endimic to Swan River estuary, Autralia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4JP6V'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46568564'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3419161'; % Taxonomicon
metaData.links.id_WoRMS = '712551'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-westraliae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus}}';
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
bibkey = 'CoulHall2017'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.ecss.2017.03.028}, ' ...
'author = {Peter G. Coulson and Norman G. Hall and Ian C. Potter}, ' ... 
'year = {2017}, ' ...
'title = {Variations in biological characteristics of temperate gonochoristic species of {P}latycephalidae and their implications: {A} review}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {190(5)}, ' ...
'pages = {50-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-westraliae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
