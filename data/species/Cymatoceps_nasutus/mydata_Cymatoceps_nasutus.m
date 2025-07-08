function [data, auxData, metaData, txtData, weights] = mydata_Cymatoceps_nasutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Cymatoceps_nasutus'; 
metaData.species_en = 'Black musselcracker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 06];

%% set data
% zero-variate data

data.am = 46*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BuxtClar1989';   
  temp.am = C2K(23.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 53;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 2860; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Li^3.06, see F1';
data.Wwi = 69018; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^3.06, see F1; max published weight 34.4 kg';

data.GSI  = 0.027; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'BuxtClar1989';   
  temp.GSI = C2K(23.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.473	14.223
1.478	13.935
1.538	15.625
1.656	18.723
1.657	17.596
2.188	19.564
2.543	30.266
2.602	23.224
2.661	24.632
2.720	20.969
2.780	16.744
3.134	34.769
3.135	28.009
3.194	25.192
3.489	24.345
3.606	36.175
3.607	34.203
3.608	29.696
3.609	28.569
3.667	26.597
3.726	30.822
3.727	21.808
4.140	24.340
4.141	26.031
4.142	28.002
4.143	29.411
4.258	38.143
4.495	25.747
4.554	27.155
4.731	36.449
4.732	33.914
4.733	32.787
4.790	31.942
5.027	27.715
5.086	39.827
5.558	34.472
5.559	44.331
6.091	41.511
6.151	31.088
6.210	42.919
6.211	36.158
6.505	43.762
6.506	44.889
6.624	38.972
7.156	40.377
7.215	42.912
7.511	43.755
8.102	53.047
8.516	52.200
8.517	53.890
8.575	43.185
8.576	50.509
8.634	44.875
8.635	46.002
9.108	44.027
9.758	51.628
9.759	54.164
10.172	53.034
10.173	50.781
10.763	55.566
10.764	60.636
10.823	56.692
11.000	65.987
11.237	58.380
11.296	60.069
11.651	54.997
11.710	57.250
12.065	55.557
12.124	58.937
12.538	57.244
12.597	64.005
12.598	56.117
12.656	66.258
12.657	47.385
12.715	57.807
13.543	68.787
13.957	62.306
14.134	59.206
14.489	66.246
14.548	68.781
14.549	70.189
14.608	56.386
14.667	59.203
14.668	61.174
14.669	62.865
14.962	76.947
15.495	71.592
15.613	58.915
15.968	67.363
16.086	61.729
16.559	72.712
16.914	72.991
17.387	68.481
17.565	74.677
17.860	56.647
22.651	75.771
23.419	75.766
25.430	72.373
25.489	69.274
25.903	85.610
27.027	74.616
28.565	87.846
36.548	88.922
38.441	102.994
44.473	109.434
45.419	103.231];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.9);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL  = C2K(23.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BuxtClar1989'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

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
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '335X5'; % Cat of Life
metaData.links.id_ITIS = '647933'; % ITIS
metaData.links.id_EoL = '46580051'; % Ency of Life
metaData.links.id_Wiki = 'Cymatoceps_nasutus'; % Wikipedia
metaData.links.id_ADW = 'Cymatoceps_nasutus'; % ADW
metaData.links.id_Taxo = '45312'; % Taxonomicon
metaData.links.id_WoRMS = '218601'; % WoRMS
metaData.links.id_fishbase = 'Cymatoceps-nasutus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cymatoceps_nasutus}}';
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
bibkey = 'BuxtClar1989'; type = 'article'; bib = [ ... 
'doi = {10.2989/02577618909504551}, ' ...
'author = {Buxton, C.D. and J.R. Clarke}, ' ... 
'year = {1989}, ' ...
'title = {The growth of \emph{Cymatoceps nasutus} ({T}eleostei: {S}paridae), with comments on diet and reproduction}, ' ...
'journal = {S. Afr. J. Mar. Sci.}, ' ...
'chapter = {8}, ' ...
'pages = {57-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cymatoceps-nasutus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

