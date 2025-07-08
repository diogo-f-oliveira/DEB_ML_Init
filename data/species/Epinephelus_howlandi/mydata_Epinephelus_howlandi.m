function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_howlandi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_howlandi'; 
metaData.species_en = 'Blacksaddle grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 30];

%% set data
% zero-variate data

data.ab = 3.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'OhtaAkit2017';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 55;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 209;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^3.04, see F1';
data.Wwi = 2295;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.04, see F1';

data.Ri  = 2319876/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
2.035	29.625
2.042	32.943
2.068	28.709
2.134	27.336
2.156	21.043
3.001	27.676
3.005	29.964
3.033	26.417
3.037	28.476
3.047	33.167
3.109	29.620
3.147	31.222
3.148	31.908
3.943	31.333
3.982	33.621
3.983	34.079
3.986	35.108
4.017	33.506
4.019	34.536
4.023	36.710
4.045	30.188
4.084	32.362
4.085	32.934
5.018	32.015
5.049	30.527
5.054	32.701
5.063	37.392
5.091	34.074
5.094	35.332
5.100	38.536
5.124	33.044
5.125	33.616
5.131	36.476
6.023	32.468
6.039	40.362
6.062	34.527
6.063	35.099
6.070	38.646
6.072	39.447
6.074	40.706
6.104	38.303
6.134	36.014
6.137	37.387
6.148	42.879
6.931	36.240
6.996	34.180
7.003	37.955
7.010	41.159
7.041	39.443
7.063	33.493
7.071	37.040
7.136	34.980
7.968	35.777
7.970	36.464
7.974	38.409
8.006	37.379
8.010	39.324
8.017	42.528
8.118	41.269
8.151	40.239
8.909	38.634
9.050	39.663
9.113	37.031
9.115	37.832
9.991	42.748
10.023	41.718
10.090	40.459
10.988	39.311
10.990	40.569
10.993	41.828
11.933	44.341
11.961	41.366
11.999	43.082
12.060	38.963
12.132	40.221
13.141	42.505
13.975	44.332
15.985	45.239
16.120	43.407
17.164	45.805];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'OhtaAkit2017'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5PC'; % Cat of Life
metaData.links.id_ITIS = '551066'; % ITIS
metaData.links.id_EoL = '46579679'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_howlandi'; % ADW
metaData.links.id_Taxo = '105890'; % Taxonomicon
metaData.links.id_WoRMS = '273856'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-howlandi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus}}';
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
bibkey = 'OhtaAkit2017'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-017-0655-5}, ' ...
'author = {Ohta, I. and Akita, Y. and Uehara, M. and Ebisawa, A.}, ' ... 
'year = {2017}, ' ...
'title = {Age-based demography and reproductive biology of three \emph{Epinephelus} groupers, \emph{E. polyphekadion}, \emph{E. tauvina}, and \emph{E. howlandi} ({S}erranidae), inhabiting coral reefs in {O}kinawa}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {100(11)}, '...
'pages = {1451–1467}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-howlandi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

