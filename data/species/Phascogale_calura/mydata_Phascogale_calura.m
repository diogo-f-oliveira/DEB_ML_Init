function [data, auxData, metaData, txtData, weights] = mydata_Phascogale_calura

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Phascogale_calura'; 
metaData.species_en = 'Red-tailed phascogale'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 30]; 

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 330;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.7*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(35.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'male life span 11 mnth in the wild, but 3 yr in captivity (Wiki)';

data.Wwb = 0.0235;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Dasyurus viverrinus';
data.Wwi = 43;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'AnAge';
data.Wwim = 43;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'AnAge';

data.Ri  = 7.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7.5 pups per litter, 1 litter per yr';
 
% univariate data
% time-weight
data.tW_f = [ ... % time since  birth (d), wet weight (g)
61.888	6.107
63.007	9.084
64.918	6.031
65.915	7.557
65.919	8.550
66.041	10.000
66.044	10.687
68.955	10.153
68.958	10.992
71.981	9.008
72.801	10.000
72.861	10.458
72.864	11.221
72.983	11.908
75.960	13.053
75.963	13.969
79.046	12.443
79.099	11.221
79.860	12.137
79.922	13.053
84.070	15.802
84.126	15.115
86.923	15.038
89.017	13.969
89.020	14.885
92.933	17.023
92.937	17.939
95.921	21.069
95.924	21.985
95.976	20.229
96.086	18.626
97.991	13.969
97.996	15.191
98.006	17.939
98.010	18.855
98.015	20.076
101.041	18.931
101.044	19.695
101.154	18.244
105.054	16.947
105.116	17.863
108.038	20.153
108.041	20.916
108.045	21.985
108.052	23.740
108.056	24.809];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(35.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'FostTagg2008';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
64.980	7.023
71.810	10.000
72.868	12.290
75.909	15.115
79.984	14.046
84.075	17.023
86.985	16.107
89.025	16.031
93.058	19.160
96.045	23.053
98.003	17.023
98.027	23.130
98.077	20.992
98.078	21.450
98.081	22.061
101.050	21.221
101.053	22.137
105.008	20.153
105.011	20.992
105.016	22.214
105.051	16.107
108.049	22.824
108.066	27.252
108.119	25.878];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(35.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'FostTagg2008';
comment.tW_m = 'data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4FVN7'; % Cat of Life
metaData.links.id_ITIS = '552621'; % ITIS
metaData.links.id_EoL = '323736'; % Ency of Life
metaData.links.id_Wiki = 'Phascogale_calura'; % Wikipedia
metaData.links.id_ADW = 'Phascogale_calura'; % ADW
metaData.links.id_Taxo = '59939'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800075'; % MSW3
metaData.links.id_AnAge = 'Phascogale_calura'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phascogale_calura}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phascogale_calura}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FostTagg2008'; type = 'Article'; bib = [ ... 
'author = {W. K. Foster and D. A. Taggart}, ' ... 
'doi = {10.1111/j.1469-7998.2008.00429.x}, ' ...
'year = {2008}, ' ...
'title = {Gender and parental influences on the growth of a sexually dimorphic carnivorous marsupial}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {275}, ' ...
'pages = {221-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

