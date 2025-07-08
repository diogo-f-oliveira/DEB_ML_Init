function [data, auxData, metaData, txtData, weights] = mydata_Chydorus_pubescens
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Chydorus_pubescens'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN','TP'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(23.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 10]; 

%% set data
% zero-variate data

data.ab = 1.96;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'SantRoch2006';   
  temp.ab = C2K(23.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.37;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'SantRoch2006';   
  temp.tp = C2K(23.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 31;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SantRoch2006';   
  temp.am = C2K(23.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02416; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SantRoch2006';
data.Lp  = 0.03395; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SantRoch2006';
data.Li  = 0.038912;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SantRoch2006';

data.Wwi  = 1.2e-5;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length Li, height Li, width 100 mum ; pi/4*0.038912^2*0.01'; 

data.Ri  = 2/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SantRoch2006';   
  temp.Ri = C2K(23.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per brood, brood interval 2 d';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.964	0.242
2.002	0.292
3.004	0.292
4.005	0.337
4.969	0.351
6.044	0.355
7.046	0.370
8.047	0.371
9.011	0.371
10.012	0.377
11.014	0.390
12.015	0.390
13.016	0.389
13.980	0.389
15.019	0.390
15.983	0.389
16.947	0.390
18.022	0.390
18.986	0.390
21.990	0.389
23.028	0.389
23.993	0.390
24.957	0.389
25.958	0.390
28.925	0.390
30.000	0.390
30.964	0.390];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(23.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SantRoch2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
metaData.links.id_CoL = 'V47Y'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '9055669'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5314895'; % Taxonomicon
metaData.links.id_WoRMS = '1302442'; % WoRMS

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
bibkey = 'SantRoch2006'; type = 'Article'; bib = [ ... 
'author = {Santos-Wisniewski M. J. and Rocha, O. and Matsumura-Tundisi, T.}, ' ... 
'year = {2006}, ' ...
'title = {Aspects of the life cycle of \emph{Chydorus pubescens} {S}ars, 1901 ({C}ladocera, Chydoridae)}, ' ...
'journal = {Acta Limnol. Bras.}, ' ...
'volume = {18(3)}, ' ...
'pages = {305-310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
