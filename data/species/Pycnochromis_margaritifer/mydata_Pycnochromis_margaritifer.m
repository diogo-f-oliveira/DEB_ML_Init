function [data, auxData, metaData, txtData, weights] = mydata_Pycnochromis_margaritifer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Pycnochromis_margaritifer'; 
metaData.species_en = 'Bicolor chromis'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 05];

%% set data
% zero-variate data

data.ab = 5.3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'RuttHami2011';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 10.2;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Chromis chromis: pi/6*0.085^3'; 
data.Wwp = 2.0;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01660*Lp^2.97, see F1';
data.Wwi = 16.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^2.97, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL_P = [ ... % time since hatch (yr), std length (cm)
0.443	1.808
0.477	1.685
1.044	2.197
1.082	2.491
1.963	2.782
2.031	2.586
2.037	3.173
2.067	2.684
2.956	3.733
2.990	3.586
3.058	3.341
3.098	3.831
3.940	3.779
3.977	3.950
3.979	4.097
5.000	4.412
5.034	4.216
5.107	4.558
5.982	4.188
6.020	4.457
7.143	4.405
7.148	4.894
9.083	5.157
9.086	5.451
10.002	5.693
10.070	5.546
10.984	5.567
11.091	5.714
12.074	5.661
13.029	6.295
13.095	5.878
14.048	6.389];
data.tL_P(:,1) = (0 + data.tL_P(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-8;end;end
units.tL_P = {'d', 'cm'};  label.tL_P = {'time since birth', 'std length','Palmyra'};  
temp.tL_P = C2K(28.5);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'RuttHami2011';
comment.tL_P = 'Data from Palmyra'; 
%
data.tL_K = [ ... % time since hatch (yr), std length (cm)
0.901	2.002
1.045	2.295
1.964	2.855
2.985	3.072
4.043	3.485
5.002	4.534
5.031	3.922
5.033	4.118
5.986	4.604
6.018	4.335
6.088	4.237
6.965	4.185
7.005	4.650
7.992	4.989
8.022	4.500
8.029	5.136
8.060	4.720
8.975	4.913
12.989	5.879
13.089	5.291
15.028	6.019];
data.tL_K(:,1) = (0 + data.tL_K(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_K,1); if data.tL_K(i,1)<=data.tL_K(i-1,1);data.tL_K(i,1)=data.tL_K(i-1,1)+1e-8;end;end
units.tL_K = {'d', 'cm'};  label.tL_K = {'time since birth', 'std length','Kiritimati'};  
temp.tL_K = C2K(28.5);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'RuttHami2011';
comment.tL_K = 'Data from Kiritimati'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_P = 10 * weights.tL_P;
weights.tL_K = 10 * weights.tL_K;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g = 0.01660*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Group plots
set1 = {'tL_P','tL_K'}; subtitle1 = {'Data from Palmyra, Kiritimati'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '5YHPL'; % Cat of Life
metaData.links.id_ITIS = '615804'; % ITIS
metaData.links.id_EoL = '46572275'; % Ency of Life
metaData.links.id_Wiki = 'Pycnochromis_margaritifer'; % Wikipedia
metaData.links.id_ADW = 'Chromis_margaritifer'; % ADW
metaData.links.id_Taxo = '224010'; % Taxonomicon
metaData.links.id_WoRMS = '1605310'; % WoRMS
metaData.links.id_fishbase = 'Pycnochromis-margaritifer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pycnochromis_margaritifer}}';
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
bibkey = 'RuttHami2011'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0021062}, ' ...
'author = {Ruttenberg B.I. and Hamilton, S.L. and Walsh, S.M. and Donovan, M.K. and Friedlander, A. and et al.}, ' ...
'year = {2011}, ' ...
'title = {Predator-Induced Demographic Shifts in Coral Reef Fish Assemblages}, ' ... 
'journal = {PLoSONE}, ' ...
'volume = {6(6)}, '...
'pages = {e21062}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Pycnochromis-margaritifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

