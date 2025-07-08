function [data, auxData, metaData, txtData, weights] = mydata_Pseudosida_bidentata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Pseudosida_bidentata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 16]; 

%% set data
% zero-variate data

data.ab = 2.1;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Venk1990';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Venk1990';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 34;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Venk1990';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.057; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Venk1990';
data.Lp  = 0.11; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Venk1990';
data.Li  = 0.195;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Venk1990';
  
data.Wdi  = 88;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(195/370)^3';

data.Ri = 6/1.5; units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Venk1990';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 6 neonates per instar of 36 h';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm)
1	0.575
2	0.777
3	1.017
4	1.140
5	1.350
6	1.438
7	1.482
8	1.518
9	1.576
10	1.590
11	1.643
12	1.665
13	1.697
14	1.741
15	1.751
16	1.791
17	1.805
18	1.849
19	1.855
20	1.908
21	1.913
22	1.914
23	1.915
24	1.933
25	1.947];
data.tL(1:4,1) =  data.tL(1:4,1)*21/24; data.tL(5:end,1) =  data.tL(5:end,1)* 36/24 - 4*15/24; % convert instar to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Venk1990'; 
comment.tL = 'conversion of instar to d is based on 21 h for first 4 instars, 36 h for later ones';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.Li = 3 * weights.Li; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '6WGGL'; % Cat of Life
metaData.links.id_ITIS = '83868'; % ITIS
metaData.links.id_EoL = '338873'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Pseudosida_bidentata'; % ADW
metaData.links.id_Taxo = '552494'; % Taxonomicon
metaData.links.id_WoRMS = '1298095'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Venk1990'; type = 'Article'; bib = [ ... 
'author = {Krishnamoorthy Venkataraman}, ' ... 
'year = {1990}, ' ...
'title = {Life history studies on some cladocera under laboratory conditions}, ' ...
'journal = {J. Andaman Sci. Assoc.}, ' ...
'volume = {6(2)}, ' ...
'pages = {127-132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
