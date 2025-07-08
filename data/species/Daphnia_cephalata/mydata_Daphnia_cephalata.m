function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_cephalata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_cephalata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi','TA','TO'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 11]; 

%% set data
% zero-variate data

data.ab = 1.62;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'MuruMoor1988';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.9;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'MuruMoor1988';   
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 52;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MuruMoor1988';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.090; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'MuruMoor1988';
data.Lp  = 0.178; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MuruMoor1988';
data.Li  = 0.385;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MuruMoor1988';
  
data.Wdi  = 676;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(385/370)^3';

data.Ri  = 200/(52-5);  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MuruMoor1988';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % instar (#), length (mm)
 1	0.898
 2	1.061
 3	1.784
 4	2.185
 5	2.438
 6	2.551
 7	2.709
 8	2.776
 9	2.838
10	2.945
11	3.006
12	3.102
13	3.243
14	3.378
15	3.445
16	3.479
17	3.495
18	3.551
19	3.579
20	3.629
21	3.719
22	3.753
23	3.820
24	3.854];
data.tL(:,1) = data.tL(:,1) - 1; % start counting from 0
data.tL(:,1) = data.tL(:,1)*2; % convert instar # to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuruMoor1988'; 

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
metaData.links.id_CoL = '3459M'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3208998'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4615044'; % Taxonomicon
metaData.links.id_WoRMS = '1302472'; % WoRMS

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
bibkey = 'MuruMoor1988'; type = 'Article'; bib = [ ... 
'author = {N. Murugan and R. K. Moorthy}, ' ... 
'year = {1988}, ' ...
'title = {Laboratory studies on the life span, growth, fecundity and embryonic development of \emph{Daphnia cephalata} {K}ing ({C}rustacea: {D}aphniidae)}, ' ...
'journal = {Proc. Indian Acad. Sci. (Anim. Sci.)}, ' ...
'volume = {97(4)}, ' ...
'pages = {367-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
