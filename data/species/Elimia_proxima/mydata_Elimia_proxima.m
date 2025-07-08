function [data, auxData, metaData, txtData, weights] = mydata_Elimia_proxima

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Pleuroceridae';
metaData.species    = 'Elimia_proxima'; 
metaData.species_en = 'Sprite elimia '; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ap'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 02]; 

%% set data
% zero-variate data

data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'StivWalt1967';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.05; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'guess';
data.Lp  = 0.3;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 0.75;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'StivWalt1967';

data.Ri  = 12*70/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '70 young per litter, 1 litter per month';
  
% uni-variate data
% length-change in length
data.LdL = [ ... % shell length (cm), shell length increment after 1 mnth (cm)
0.156	0.061
0.196	0.053
0.228	0.051
0.274	0.037
0.309	0.029
0.366	0.034
0.394	0.026
0.446	0.018
0.475	0.019];
data.LdL(:,2) = data.LdL(:,2)/30.5; % cm/mnth to cm/d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'time birth', 'change in shell length'};  
temp.LdL    = C2K(15);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'StivWalt1967';

% lngth-weight
data.LWw = [ ... % shell length (cm), wet weight (mg)
0.114	4.087
0.140	1.305
0.147	3.273
0.163	3.817
0.171	4.450
0.179	6.219
0.188	7.251
0.189	6.220
0.199	8.573
0.207	6.580
0.211	9.067
0.218	7.566
0.220	10.425
0.230	8.344
0.230	11.658
0.241	7.363
0.247	9.868
0.259	13.043
0.260	10.010
0.271	13.047
0.282	13.052
0.290	14.594
0.300	15.011
0.310	15.655
0.313	13.620
0.319	17.752
0.325	18.513
0.328	30.574
0.340	26.606
0.370	20.721
0.370	28.950
0.376	51.985
0.379	35.689
0.392	35.701
0.412	98.780
0.416	116.773
0.436	123.533
0.440	59.865
0.448	53.562
0.461	67.903
0.468	170.354
0.475	97.585
0.496	94.959
0.501	103.254
0.507	113.850
0.520	120.420
0.530	161.399
0.540	110.822
0.551	188.240
0.561	180.584
0.572	201.944
0.579	278.284
0.600	315.650
0.601	245.635
0.614	333.873
0.626	329.360];
data.LWw(:,2) = data.LWw(:,2)/1e3; % convert mg to g
units.LWw   = {'cm', 'g'};  label.LWw = {'time birth', 'total wet weight'};  
bibkey.LWw = 'StivWalt1967';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 10 * weights.LdL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'ovoviviparous and parthenogenetic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6F3Q4'; % Cat of Life
metaData.links.id_ITIS = '71820'; % ITIS
metaData.links.id_EoL = '47877448'; % Ency of Life
metaData.links.id_Wiki = 'Elimia'; % Wikipedia
metaData.links.id_ADW = 'Elimia_proxima'; % ADW
metaData.links.id_Taxo = '366877'; % Taxonomicon
metaData.links.id_WoRMS = '1116967'; % WoRMS
metaData.links.id_molluscabase = '1116967'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elimia}}';
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
bibkey = 'StivWalt1967'; type = 'Article'; bib = [ ... 
'author = {Alan E. Stiven and Clarence R. Walton}, ' ... 
'year = {1967}, ' ...
'title = {Age and Shell Growth in the Freshwater Snail, \emph{Goniobasis proxima} ({S}ay)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {78(1)}, ' ...
'pages = {207-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

