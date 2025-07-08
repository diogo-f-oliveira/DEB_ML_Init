function [data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_dubia 

%% set metaData

metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Ceriodaphnia_quadrangula';  
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdi';'Ni'; };  % tags for different types of zero-variate data
metaData.data_1     = {'X-ap';'t-N';'t-L'; }; % tags for different types of uni-variate data

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 16];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 16];

%% set data
% zero-variate data;

data.ab = 1.5;   units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'Lync1992';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on intermoult interval of 2.3 d';
data.am = 50;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Lync1992';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 0.037;      units.Lb = 'cm';    label.Lb = 'length at birth';  bibkey.Lb = 'Lync1992';    
data.Lp  = 0.09;   units.Lp  = 'cm';   label.Lp  = 'length at puberty';  bibkey.Lp  = 'Lync1992';
data.Li  = 0.135;   units.Li  = 'cm';   label.Li  = 'ultimate length';    bibkey.Li  = 'Lync1992';
 
% weight
data.Wdb = 6.2e-7;  units.Wdb = 'g';    label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'Lync1992';
data.Wdi = 13e-6; units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'Lync1992';

% uni-variate data

% length-length-cum reprod
ntLN = [ ... % instar(#), duration(d), length(cm), clutch (#)
 1	1.775 0.042  0
 2	1.346 0.074  0
 3	1.545 0.088  0
 4	2.100 0.094  5.719
 5	2.247 0.101  9.767
 6	2.351 0.107 14.436
 7	2.506 0.109 14.108
 8	2.303 0.113 14.560
 9	2.359 0.118 15.327
10	2.506 0.119 16.718
11	2.411 0.122 17.639
12	2.273 0.125 16.841
13	2.455 0.125 16.203
14	2.416 0.127 17.591
15	2.238 0.130 16.015
16	2.152 0.131 13.968
17	2.610 0.133 11.142
18	2.429 0.134  7.844];
data.tLN = [cumsum(ntLN(:,2),1), ntLN(:,3), cumsum(ntLN(:,4),1)];
units.tLN   = {'d', 'cm', '#'};  label.tLN = {'time since birth', 'length', 'cum reprod'};  
temp.tLN    = C2K(20);  units.temp.tLN = 'K'; label.temp.tLN = 'temperature';
bibkey.tLN = 'Lync1992'; treat.tLN = {1 {'length','cum reprod'}};
	
data.Xtp = [ ... % food density (mug C/mL),  time at first reproduction (d)
0.058	15.915
0.147	10.389
0.532	 9.416
1.537	 9.221
3.083	 9.533];
data.Xtp(:,2) = data.Xtp(:,2) - 2.3; % convert time since birth at first reproduction to that  at puberty
units.Xtp   = {'mug C/mL','d'};  label.Xtp = {'food density', 'time since birth at puberty'};  
temp.Xtp    = C2K(20);  units.temp.Xtp = 'K'; label.temp.Xtp = 'temperature';
bibkey.Xtp = 'Lync1992'; treat.Xtp = {0};

%% set weights for all real data
weights = setweights(data, []);
weights.tLN = 5 * weights.tLN;
%weights.Li = 3 * weights.Li;
weights.Wdi = 3 * weights.Wdi;
weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_10','tL_15', 'tL_20', 'tL_25'}; subtitle1 = {'AndeBenk1994 data at 25, 20, 15, 10 C'};
% set2 = {'tN_25','tN_20','tN_15','tN_10'}; subtitle2 = {'AndeBenk1994 data at 25, 20, 15, 10 C'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1, subtitle2};

%% Links
metaData.links.id_CoL = 'SY6Y'; % Cat of Life
metaData.links.id_ITIS = '83907'; % ITIS
metaData.links.id_EoL = '46498279'; % Ency of Life
metaData.links.id_Wiki = 'Ceriodaphnia'; % Wikipedia
metaData.links.id_ADW = 'Ceriodaphnia_quadrangula'; % ADW
metaData.links.id_Taxo = '156176'; % Taxonomicon
metaData.links.id_WoRMS = '148408'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ceriodaphnia_quadrangula}}';
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
bibkey = 'Lync1992'; type = 'Article'; bib = [...
'doi = {10.2307/1940015}, ' ...
'author = {Lynch, M.}, ' ... 
'year = {1992}, ' ...
'title = {The Life History Consequences of Resource Depression in \emph{Ceriodaphnia quadrangula} and \emph{Daphnia ambigua}}, ' ...
'journal = {Ecology, , }, ' ...
'volume = {73(5)}, ' ...
'pages = {1620–1629}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
