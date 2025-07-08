function [data, auxData, metaData, txtData, weights] = mydata_Anolis_acutus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Dactyloidae';
metaData.species    = 'Anolis_acutus';
metaData.species_en = 'St. Croix''s anole';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 06];

%% set data
% zero-variate data;
data.ab = 50;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.0;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'RuibPhil1972';
data.Lp  = 3.9;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'RuibPhil1972';
data.Li  = 4.4;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'RuibPhil1972';
data.Lim = 6.3;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'RuibPhil1972';

data.Wwb = 0.26; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RuibPhil1972';
  comment.Wwim = '0.21-0.30 g';
data.Wwi = 3.05; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'RuibPhil1972';
  comment.Wwi = 'based on Anolis_gundlachi and Li: (4.4/5)^3*2.9';
data.Wwim = 7.44; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'RuibPhil1972';

data.Ri  = 18/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anolis_gundlachi';

% uni-variate data
% length-change in length
data.LdL_f = [... % SVL (cm), change in SVL (cm/d)
    2.6 0.007
    3.7 0.006];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(20);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'RuibPhil1972'; 
%
data.LdL_m = [... % SVL (cm), change in SVL (cm/d)
    3.7 0.014
    4.6 0.011
    5.4 0.004];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(20);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'RuibPhil1972'; 

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
2.175	0.510
2.293	0.461
2.366	0.596
2.454	0.657
2.542	0.620
2.659	0.657
2.674	0.608
2.747	0.780
2.776	0.620
2.849	0.804
2.952	0.853
2.967	0.755
2.996	0.890
3.025	0.853
3.142	1.098
3.201	0.976
3.201	0.865
3.303	1.159
3.303	1.000
3.494	1.061
3.508	1.441
3.508	1.306
3.787	1.245
3.890	1.073
4.019	2.090
4.019	1.992
4.122	2.041
4.210	2.127
4.225	2.029
4.296	2.922
4.298	2.163
4.311	2.469
4.415	2.237];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'female'};  
bibkey.LW_f = 'RuibPhil1972'; 
%
data.LW_m = [ ... % SVL (cm), weight (g)
3.888	1.637
4.253	2.322
4.502	2.604
4.503	2.176
4.793	3.388
4.941	2.910
5.129	4.000
5.319	4.343
5.348	4.269
5.348	4.220
5.521	5.567
5.624	5.286
5.694	6.608
5.814	5.714
5.816	4.820
5.829	5.408
6.337	7.441];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'male'};  
bibkey.LW_m = 'RuibPhil1972'; 

%% set weights for all real data
weights = setweights(data, []);
%weights.LdL_f = 3 * weights.LdL_f;
%weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;
weights.Lb = 3 * weights.Lb;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '66TZP'; % Cat of Life
metaData.links.id_ITIS = '173884'; % ITIS
metaData.links.id_EoL = '795912'; % Ency of Life
metaData.links.id_Wiki = 'Anolis_acutus'; % Wikipedia
metaData.links.id_ADW = 'Anolis_acutus'; % ADW
metaData.links.id_Taxo = '249797'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anolis&species=acutus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anolis_acutus}}';   
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
bibkey = 'RuibPhil1972'; type = 'Article'; bib = [ ...  
'author = {Rodolfo Ruibal and Richard Philibosian and Janet L. Adkins}, ' ...
'title = {Reproductive Cycle and Growth in the Lizard \emp{Anolis acutus}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1972(3)}, ' ...
'pages = {509-518}, ' ...
'year = {1972}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

