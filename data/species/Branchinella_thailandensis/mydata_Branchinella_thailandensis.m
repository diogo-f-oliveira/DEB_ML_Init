function [data, auxData, metaData, txtData, weights] = mydata_Branchinella_thailandensis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Thamnocephalidae';
metaData.species    = 'Branchinella_thailandensis'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 20]; 

%% set data
% zero-variate data

data.ab = 3;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'DaraStra2011';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6.5;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DaraStra2011';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22.5;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'DaraStra2011';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.04; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Phallocryptus_spinosus';
data.Lp  = 2.0;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'DaraStra2011';
data.Li  = 2.78; units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'DaraStra2011';
data.Lim = 2.62; units.Lim = 'cm'; label.Lim  = 'ultimate total length for males'; bibkey.Lim = 'DaraStra2011';
  
data.Wdi  = 0.0365;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.78/1)^3';

data.Ri  = 6365/(22.5-6.5); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DaraStra2011';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6365 eggs in 22.5-6.5 d';

data.sM  = 5;   units.sM  = '-'; label.sM  = 'acceleration factor';      bibkey.sM  = 'guess';   
  comment.sM = 'pseudo-data based on mean value for fairy shrimps';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
0.000	0.022
4.797	2.105
9.731	2.345
14.664	2.580
19.603	2.755
24.652	2.913];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length','female'};  
temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'DaraStra2011'; 
%
data.tL_m = [ ... % time since birth (d), length (cm)
0.000	0.010
5.004	2.045
10.188	2.222
15.040	2.399
20.003	2.570
24.973	2.559];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'length','male'};  
temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'DaraStra2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Li = 3 * weights.Li; 
weights.Lim = 3 * weights.Lim; 
weights.sM = 0.2 * weights.sM; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males as assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WXMR'; % Cat of Life
metaData.links.id_ITIS = '1123622'; % ITIS
metaData.links.id_EoL = '1123622'; % Ency of Life
metaData.links.id_Wiki = 'Branchinella'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5287582'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

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
bibkey = 'DaraStra2011'; type = 'Article'; bib = [ ... 
'doi = {10.1651/10-3410.1}, ' ...
'author = {Wipavee Dararat and Peter L. Starkweather and La-orsri Sanoamuang}, ' ... 
'year = {2011}, ' ...
'title = {LIFE HISTORY OF THREE FAIRY SHRIMPS ({B}RANCHIOPODA: {A}NOSTRACA) FROM {T}HAILAND}, ' ...
'journal = {Journal of crustacean biology}, ' ...
'volume = {31(4)}, ' ...
'pages = {623-629}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
