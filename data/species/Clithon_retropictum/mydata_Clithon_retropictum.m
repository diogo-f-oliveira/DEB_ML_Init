function [data, auxData, metaData, txtData, weights] = mydata_Clithon_retropictum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neritopsina'; % formally a superorder, but rank is uncertain
metaData.family     = 'Neritidae';
metaData.species    = 'Clithon_retropictum'; 
metaData.species_en = 'Ishimaki thorn nerite'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'THp', 'MPE'};
metaData.ecoCode.habitat = {'0jMc', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 01]; 

%% set data
% zero-variate data

data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ShigKato2001';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.08; units.Lj  = 'cm';  label.Lj  = 'shell diameter at settlement';        bibkey.Lj  = 'guess';
  comment.Lj = 'based on Theodoxus fluviatilis';
data.Lp  = 0.8; units.Lp  = 'cm';  label.Lp  = 'shell diameter at puberty'; bibkey.Lp  = 'KobaIwas2002';
data.Li  = 1.8; units.Li  = 'cm';  label.Li  = 'ultimate shell diameter';              bibkey.Li  = 'KobaIwas2002';

data.Wwb  = 4.19e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';
data.Wdi  = 8e-3; units.Wdi  = 'g';  label.Wdi  = 'tissue dry weight at shell diameter 0.75';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based on Theodoxus fluviatilis';

data.Ri  = 750/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.98';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), operculum length (cm)
0.973	0.583
1.935	0.779
1.974	0.826
2.094	0.920
2.196	0.707
2.983	0.964
3.111	0.948
3.961	0.957
3.969	0.855
4.004	0.940
4.937	0.971
4.942	0.902
4.973	1.054
4.977	1.004
5.024	0.946
5.947	1.090
5.954	1.010
5.959	0.941
5.983	1.170
6.925	1.088
6.973	1.019
7.912	0.962
7.939	1.163
7.951	1.003
8.029	1.089
8.955	1.202
8.968	1.037
9.050	1.075
9.087	1.150
10.150	1.134
16.986	1.209];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'operculum length', 'female'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShigKato2001';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), operculum length (cm)
0.960	0.751
1.007	0.690
1.052	0.660
1.055	0.621
2.023	0.740
2.024	0.732
2.025	0.732
2.102	0.812
2.165	0.556
2.996	0.796
2.997	0.780
2.998	0.766
3.842	0.843
3.845	0.805
3.966	0.885
5.022	0.963
5.741	1.016
5.956	0.983
6.853	0.925
6.890	0.989
6.935	0.953
6.972	1.033
7.909	1.006
7.914	0.940
8.923	1.078];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'operculum length', 'male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShigKato2001';
comment.tL_m = 'Data for males';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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

%% Discussion
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Veliger in the sea, migrates upriver after settlement';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YYZG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '45364507'; % Ency of Life
metaData.links.id_Wiki = 'Clithon_retropictum'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5319174'; % Taxonomicon
metaData.links.id_WoRMS = '737538'; % WoRMS not present
metaData.links.id_molluscabase = '737538'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clithon_retropictum}}';
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
bibkey = 'ShigKato2001'; type = 'Article'; bib = [ ... 
'author = {Yusuke Shigemiya and Makoto Kato}, ' ... 
'year = {2001}, ' ...
'title = {Age distribution, growth, and lifetime copulation frequency of a freshwater snail, \emph{Clithon retropictus} ({N}eritidae)}, ' ...
'journal = {Popul Ecol}, ' ...
'volume = {43}, ' ...
'pages = {133-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KobaIwas2002'; type = 'Article'; bib = [ ... 
'author = {Satoshi Kobayashi and Keiji Iwasaki}, ' ... 
'year = {2002}, ' ...
'title = {Distribution and Spatio-temporal Variation in the Population Structure of the Fluvial Neritid Gastropod \emph{Clithon retropictus}}, ' ...
'journal = {Benthos Research}, ' ...
'volume = {57(2)}, ' ...
'pages = {91-101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
