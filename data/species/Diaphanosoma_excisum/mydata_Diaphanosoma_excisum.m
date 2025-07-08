function [data, auxData, metaData, txtData, weights] = mydata_Diaphanosoma_excisum
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Diaphanosoma_excisum'; 
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

data.ab = 1.0;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Venk1990';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.25;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Venk1990';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 26;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Venk1990';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.057; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Venk1990';
data.Lp  = 0.085; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Venk1990';
data.Li  = 0.134;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Venk1990';
  
data.Wdi  = 28.5;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(134/370)^3';

data.Ri = 55/(26-2.25); units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Venk1990';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 55 neonates during life time';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm)
1	0.575
2	0.707
3	0.830
4	0.874
5	0.936
6	0.989
7	1.029
8	1.069
9	1.101
10	1.123
11	1.137
12	1.142
13	1.178
14	1.201
15	1.211
16	1.237
17	1.273
18	1.283
19	1.292
20	1.307
21	1.333
22	1.352];
data.tL(1:3,1) =  data.tL(1:3,1)*18/24; data.tL(4:end,1) =  data.tL(4:end,1)* 24/24 - 3*6/24; % convert instar to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Venk1990'; 
comment.tL = 'conversion of instar to d is based on 18 h for first 3 instars, 24 h for later ones';

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
metaData.links.id_CoL = '6D3KF'; % Cat of Life
metaData.links.id_ITIS = '83851'; % ITIS
metaData.links.id_EoL = '46498301'; % Ency of Life
metaData.links.id_Wiki = 'Diaphanosoma'; % Wikipedia
metaData.links.id_ADW = 'Diaphanosoma_excisum'; % ADW
metaData.links.id_Taxo = '351863'; % Taxonomicon
metaData.links.id_WoRMS = '412858'; % WoRMS

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
