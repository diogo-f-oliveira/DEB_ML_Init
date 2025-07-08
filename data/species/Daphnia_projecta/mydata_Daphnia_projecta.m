function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_projecta
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_projecta'; 
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
data.tp = 3.75;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Venk1990';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 51.6;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Venk1990';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.067; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Venk1990';
data.Lp  = 0.11; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Venk1990';
data.Li  = 0.22;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Venk1990';
  
data.Wdi  = 126;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(220/370)^3';

data.Ri = 4/2.17; units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Venk1990';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 4 neonates per instar of 52 h';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm)
1	0.671
2	0.850
3	1.152
4	1.366
5	1.468
6	1.547
7	1.609
8	1.732
9	1.772
10	1.790
11	1.843
12	1.879
13	1.897
14	1.898
15	1.921
16	1.926
17	1.944
18	1.989
19	2.011
20	2.017
21	2.048
22	2.092
23	2.115
24	2.112
25	2.156];
data.tL(1:3,1) =  data.tL(1:3,1)*30/24; data.tL(4:end,1) =  data.tL(4:end,1)* 52/24 - 3*22/24; % convert instar to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Venk1990'; 
comment.tL = 'conversion of instar to d is based on 30 h for first 3 instars, 52 h for later ones';

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
metaData.links.id_CoL = '345CQ'; % Cat of Life
metaData.links.id_ITIS = '83892'; % ITIS
metaData.links.id_EoL = '1040443'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_schoedleri'; % ADW
metaData.links.id_Taxo = '347075'; % Taxonomicon
metaData.links.id_WoRMS = '148375'; % WoRMS

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
