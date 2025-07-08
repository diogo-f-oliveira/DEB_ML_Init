function [data, auxData, metaData, txtData, weights] = mydata_Labrus_merula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Labrus_merula'; 
metaData.species_en = 'Brown wrasse';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 09]; 

%% set data
% zero-variate data

data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20.6;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on 15 to 20 cm SL and SL= 0.85*TL, from photo';
data.Li  = 53;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
  comment.Li = 'based on 45 cm SL, using SL= 0.85*TL, from photo';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DulcKozu1999';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm: pi/6*0.09^3';
data.Wwp = 137;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','GordMoli2000'};
  comment.Wwp = 'based on 0.0109*Lp^3.120, see F1';
data.Wwi = 2.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','GordMoli2000'};
  comment.Wwi = 'based on 0.0109*Li^3.120, see F1';

data.Ri  = 5e6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.94e6 eggs per kg per yr for Semicossyphus pulcher: 1.94e6*2.6/365';

% univariate data
data.tL = [ ... % time since birth (yr), total length (cm) 
0.114	11.980
0.158	14.945
0.159	15.199
0.160	15.453
0.188	13.928
0.188	13.928
0.188	14.013
0.261	15.960
1.188	24.931
1.218	23.999
1.364	18.577
1.633	19.760
2.119	25.940
2.119	25.940
2.119	25.940
2.121	26.363
2.123	26.871
2.123	26.871
2.123	26.956
2.145	23.991
2.149	24.923
2.149	24.923
2.149	24.923
2.158	27.464
2.158	27.464
2.160	28.057
2.160	28.057
2.162	28.650
2.201	21.026
2.565	21.108
2.643	24.156
2.643	24.156
3.054	28.049
3.054	28.049
3.062	30.082
3.062	30.082
3.062	30.082
3.095	30.082
3.194	29.912
3.214	26.354
3.216	27.116
3.221	28.387
3.263	30.758
3.357	29.233
3.586	28.723
3.593	30.501
3.611	26.351
3.613	27.028
3.621	29.231
4.161	31.852
4.269	25.159
4.343	27.361
4.489	31.087
4.608	27.443
4.611	28.121
4.616	29.476
5.148	30.065
5.148	30.065
5.148	30.065
5.149	30.488
5.150	30.742
5.150	30.742
5.151	30.912
5.163	34.130
5.219	31.504
5.219	31.504
5.221	32.097
5.226	33.452
5.278	29.471
5.329	25.404
5.475	29.130
5.623	33.195
6.145	31.157
6.189	34.122
6.298	27.768
6.309	30.648
6.309	30.648
6.309	30.648
6.310	31.071
6.373	30.054
6.642	31.153
6.644	31.746
6.644	31.746
6.644	31.746
6.675	31.153
7.194	37.163
7.359	37.161
7.366	30.046
7.480	33.857
7.516	34.788
7.607	32.500
7.607	32.500
7.609	32.924
7.640	32.415
7.672	32.246
8.160	38.933
8.176	34.020
8.295	30.631
8.295	30.631
8.300	31.817
8.315	26.819
8.603	33.254
9.178	36.553
9.349	29.013
9.354	30.453
10.240	37.137
10.535	36.457
11.233	37.128
11.316	32.469
11.406	30.096
11.634	38.057
12.330	29.326
12.344	33.053
13.212	34.825
13.618	37.193
15.269	35.993
18.223	38.001
20.187	40.780];
data.tL(:,1) = 365 * (.75 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli2000';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.0109*(TL in cm)^3.120';
metaData.bibkey.F1 = 'GordMoli2000'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3RL4J'; % Cat of Life
metaData.links.id_ITIS = '170736'; % ITIS
metaData.links.id_EoL = '46571664'; % Ency of Life
metaData.links.id_Wiki = 'Labrus_merula'; % Wikipedia
metaData.links.id_ADW = 'Labrus_merula'; % ADW
metaData.links.id_Taxo = '178026'; % Taxonomicon
metaData.links.id_WoRMS = '126967'; % WoRMS
metaData.links.id_fishbase = 'Labrus-merula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labrus_merula}}';
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
bibkey = 'GordMoli2000'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i} and Nuria Ravent\''{o}s}, ' ... 
'year = {2000}, ' ...
'title = {Growth performance of four wrasse species on the north-western {M}editerranean coast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {45}, ' ...
'pages = {43-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DulcKozu1999'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315498000368}, ' ...
'author = {Jakov, Dul\v{c}i\''{c} and Ko\v{z}ul , V.  and Kraljevic, Miro and Skaramuca , B.  and Glamuzina, Branko and R\''{e} , P. }, ' ... 
'year = {1999}, ' ...
'title = {Embryonic and larval development of the brown wrasse \emph{Labrus merula} ({P}isces: {L}abridae)}, ' ...
'journal = {Journal of the Marine Biological Association of the UK}, ' ...
'volume = {79}, ' ...
'pages = {327-332}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Labrus-merula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

