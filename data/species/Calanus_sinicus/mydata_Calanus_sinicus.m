function [data, auxData, metaData, txtData, weights] = mydata_Calanus_sinicus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Calanoida'; 
metaData.family     = 'Calanidae';
metaData.species    = 'Calanus_sinicus'; 
metaData.species_en = 'Copepod'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am';'WC0';'Wwb';'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_T';'T-ab';'T-ap';'T-JX';'T-JC';'T-R'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.am = 45;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Value inspired by Cyclops';
  
data.WC0 = 0.32; units.WC0 = 'mug';   label.WC0 = 'initial carbon weight';  bibkey.WC0 = 'JageSala2015';
data.Wwb = 1.73; units.Wwb = 'mug';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JageSala2015';
data.Wwp = 512;  units.Wwp = 'mug';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'JageSala2015';
data.Wwi = 512;  units.Wwi = 'mug';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'JageSala2015';

data.Ri  = 42;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'JageSala2015';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW_20 = [ ... % time since birth (d), volumetric length (mm)
1.470	0.120
2.464	0.171
4.020	0.237
5.014	0.308
6.009	0.365
7.262	0.449
8.473	0.497
9.899	0.561
11.628	0.622
14.006	0.691
17.291	0.757]; 
data.tW_20(:,2) = (data.tW_20(:,2)/ 10).^3; % convert cm to g for spec density 1 g/cm^3
units.tW_20  = {'d', 'g'};  label.tW_20 = {'time since birth', 'wet weight', '20 C'};  
temp.tW_20   = C2K(20.2);  units.temp.tW_20 = 'K'; label.temp.tW_20 = 'temperature';
bibkey.tW_20 = 'JageSala2015';
%
data.tW_17 = [ ... % time since birth (d), volumetric length (mm)
1.556	0.123
2.810	0.179
4.323	0.236
5.663	0.311
6.787	0.374
7.997	0.449
9.251	0.496
10.937	0.571
12.752	0.621
15.562	0.712
19.020	0.771];
data.tW_17(:,2) = (data.tW_17(:,2)/ 10).^3; % convert cm to g for spec density 1 g/cm^3
units.tW_17  = {'d', 'g'};  label.tW_17 = {'time since birth', 'wet weight', '17 C'};  
temp.tW_17   = C2K(17.5);  units.temp.tW_17 = 'K'; label.temp.tW_17 = 'temperature';
bibkey.tW_17 = 'JageSala2015';
%
data.tW_15 = [ ... % time since birth (d), volumetric length (mm)
1.945	0.125
3.847	0.180
5.836	0.241
7.867	0.315
9.640	0.377
11.412	0.443
13.617	0.501
15.605	0.564
17.983	0.634
22.219	0.720
27.104	0.781];
data.tW_15(:,2) = (data.tW_15(:,2)/ 10).^3; % convert cm to g for spec density 1 g/cm^3
units.tW_15  = {'d', 'g'};  label.tW_15 = {'time since birth', 'wet weight', '15 C'};  
temp.tW_15   = C2K(15);  units.temp.tW_15 = 'K'; label.temp.tW_15 = 'temperature';
bibkey.tW_15 = 'JageSala2015';
%
data.tW_13 = [ ... % time since birth (d), volumetric length (mm)
2.464	0.124
4.366	0.182
6.700	0.242
8.473	0.328
10.418	0.374
12.752	0.446
15.173	0.496
17.896	0.567
20.749	0.645
25.115	0.725
30.951	0.776];
data.tW_13(:,2) = (data.tW_13(:,2)/ 10).^3; % convert cm to g for spec density 1 g/cm^3
units.tW_13  = {'d', 'g'};  label.tW_13 = {'time since birth', 'wet weight', '13 C'};  
temp.tW_13   = C2K(13);  units.temp.tW_13 = 'K'; label.temp.tW_13 = 'temperature';
bibkey.tW_13 = 'JageSala2015';
%
data.tW_10 = [ ... % time since birth (d), volumetric length (mm)
3.501	0.126
7.003	0.189
10.850	0.249
12.925	0.340
15.519	0.399
18.631	0.455
21.916	0.505
25.591	0.583
29.784	0.662
35.058	0.748
41.974	0.812];
data.tW_10(:,2) = (data.tW_10(:,2)/ 10).^3; % convert cm to g for spec density 1 g/cm^3
units.tW_10  = {'d', 'g'};  label.tW_10 = {'time since birth', 'wet weight', '10.3 C'};  
temp.tW_10   = C2K(10.3);  units.temp.tW_10 = 'K'; label.temp.tW_10 = 'temperature';
bibkey.tW_10 = 'JageSala2015';

% T-JX data
data.TJX = [ ... % temperature (C), specific ingestion rate (g C/ d.g C)
6.927	0.094
6.960	0.134
7.955	0.237
10.233	0.195
8.895	0.032
9.033	0.032
10.995	0.119
11.756	0.060
12.344	0.025
14.720	0.093
13.922	0.220
17.909	0.511
17.833	0.674
17.820	0.175
17.374	0.137
17.928	0.085
17.927	0.099
20.234	0.175
18.654	0.026
20.963	0.054
22.341	0.085
22.857	0.111
23.033	0.033];
units.TJX  = {'C', 'g C/d.g C'};  label.TJX = {'temperature', 'specific ingestion rate'};  
bibkey.TJX = 'JageSala2015';
comment.TJX = 'Data from various sources. Fully grown individuals, abundant food';

% T-JC data
data.TJC = [ ... % temperature (C), specific CO_2 production (g C/ d.g C)
9.051	0.040
12.023	0.048
18.070	0.055
17.984	0.131];
units.TJC  = {'C', 'g C/d.g C'};  label.TJC = {'temperature', 'specific CO_2 production'};  
bibkey.TJC = 'JageSala2015';
comment.TJC = 'fully grown individuals, abundant food';

% T-R data
data.TR = [ ... % temperature (C), egg production (#/d)
6.959	4.004
6.993	12.674
6.890	17.215
7.646	13.504
8.093	28.645
8.230	15.022
7.990	8.277
10.945	1.967
11.838	11.194
10.326	16.550
10.017	18.612
9.570	21.912
9.983	22.328
12.010	32.938
12.388	7.895
12.423	8.858
12.285	3.628
13.866	12.997
14.691	14.791
16.959	10.954
17.577	13.297
17.955	12.887
17.955	20.043
17.955	24.034
17.577	42.884
20.017	43.039
19.914	17.579
20.945	11.394
22.320	13.743
23.007	7.830];
units.TR  = {'C', '#/d'};  label.TR = {'temperature', 'reproduction rate'};  
bibkey.TR = 'JageSala2015';
comment.TR = 'Data from various sources. Assumed:  abundant food';

data.Tab = [ ... % temperature (C), age at start NIII  (d)
20.2 1.77
17.5 2.03
15   2.52
13   3.00
10.3 4.43];
units.Tab  = {'C', 'd'};  label.Tab = {'temperature', 'age at start NIII'};  
bibkey.Tab = 'JageSala2015';
comment.Tab = 'Start NIII corresponds with birth (= start feeding)';

data.Tap = [ ... % temperature (C), age at start CVI  (d)
20.2 15.7
17.5 17.4
15   24.7
13   28.1
10.3 38.6];
units.Tap  = {'C', 'd'};  label.Tap = {'temperature', 'age at start CVI'};  
bibkey.Tap = 'JageSala2015';
comment.Tap = 'Start CVI corresponds with ceasing of growth (in length)';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 10 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_20','tW_17','tW_15','tW_13','tW_10'}; subtitle1 = {'Data at 20.2, 17.5, 15, 13, 10.3 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Growth ceases at puberty, but see F3; no acceleration, unlike other copepods in the collection';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This entry is discussed in JageSala2015. Notice, however that this ref fits a model without reserve, with the consequence that some symbols have a different meaning.';
metaData.bibkey.F1 = 'JageSala2015'; 
F2 = '6 nauplier stages, and 6 copepodite stage; nauplier stages 1-2 do not feed';
metaData.bibkey.F2 = 'JageSala2015'; 
F3 = 'Lipid content starts to increase at the transition from CII to CIII, suggesting start of allocation to reproduction';
metaData.bibkey.F3 = 'JageSala2015'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '5X6CV'; % Cat of Life
metaData.links.id_ITIS = '550443'; % ITIS
metaData.links.id_EoL = '46532559'; % Ency of Life
metaData.links.id_Wiki = 'Calanus_sinicus'; % Wikipedia
metaData.links.id_ADW = 'Calanus_sinicus'; % ADW
metaData.links.id_Taxo = '289991'; % Taxonomicon
metaData.links.id_WoRMS = '346214'; % WoRMS


%% References
bibkey = 'WORMS'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marinespecies.org/aphia.php?p=taxdetails&id=346214}}';
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
bibkey = 'JageSala2015'; type = 'Article'; bib = [ ... 
'author = {T. Jager and I. Salaberria and B. H. Hansen}, ' ... 
'year = {2015}, ' ...
'title = {Capturing the life history of the marine copepod \emph{Calanus sinicus} into a generic bioenergetics framework}, ' ...
'journal = {Ecological Modelling}, ' ...
'volume = {299}, ' ...
'pages = {114-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

