function [data, auxData, metaData, txtData, weights] = mydata_Streptocephalus_sirindhornae
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Streptocephalidae';
metaData.species    = 'Streptocephalus_sirindhornae'; 
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

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'DaraStra2011';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 13.5;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DaraStra2011';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 67.6;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'DaraStra2011';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.04; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Phallocryptus_spinosus';
data.Lp  = 1.80;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'DaraStra2011';
  comment.Lp = 'based on tp and tL data';
data.Li  = 2.43; units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'DaraStra2011';
data.Lim = 2.49; units.Lim = 'cm'; label.Lim  = 'ultimate total length for males'; bibkey.Lim = 'DaraStra2011';
  
data.Wdi  = 0.0244;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.43/1)^3';

data.Ri  = 17865/(67.6-13.5); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri = 'DaraStra2011';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '17865 eggs in 67.6-13.5 d';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
0.000	0.011
4.854	1.325
9.797	1.440
14.959	1.571
19.901	1.691
24.736	1.773
29.458	1.893
34.734	1.964
39.788	2.056
44.735	2.116
49.684	2.149
54.630	2.215
59.908	2.264
64.744	2.324
69.801	2.389
74.743	2.509
79.690	2.569
84.860	2.585
89.696	2.651];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length','female'};  
temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'DaraStra2011'; 
%
data.tL_m = [ ... % time since birth (d), length (cm)
0.221	0.006
4.929	1.092
9.672	1.235
14.747	1.362
19.713	1.461
24.676	1.627
29.862	1.754
35.048	1.853
40.013	1.969
44.759	2.035
49.946	2.128
55.022	2.217
60.099	2.299
65.070	2.271
70.038	2.292
75.003	2.414
79.978	2.263
85.054	2.357
90.242	2.423];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'length','male'};  
temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'DaraStra2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 

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
metaData.links.id_CoL = '7WXPJ'; % Cat of Life
metaData.links.id_ITIS = '624242'; % ITIS
metaData.links.id_EoL = '326788'; % Ency of Life
metaData.links.id_Wiki = 'Streptocephalus'; % Wikipedia
metaData.links.id_ADW = 'Streptocephalus_sirindhornae'; % ADW
metaData.links.id_Taxo = '948464'; % Taxonomicon
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
