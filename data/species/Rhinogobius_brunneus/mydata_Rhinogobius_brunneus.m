function [data, auxData, metaData, txtData, weights] = mydata_Rhinogobius_brunneus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Rhinogobius_brunneus'; 
metaData.species_en = 'Amur goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 23];


%% set data
% zero-variate data

data.ab = 8;   units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'KondMead2013';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 200;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Pomatoschistus minutus';
data.am = 730;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on Pomatoschistus minutus';
  
data.Lb  = 0.368;units.Lb  = 'cm';  label.Lb  = 'total length at birth';     bibkey.Lb  = 'KondMead2013';  
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length as Pomatoschistus minutus';
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 0.0012; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'KondMead2013';
  comment.Wwb = 'based on egg length of 2.75 mm and width of 0.9 mm: pi/6*0.275*0.09^2';
data.Wwp = 0.7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'from L-W relationship at Lp, see F2';
data.Wwi = 9.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'from L-W relationship at Li, see F2';

data.Ri  = 1700/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'HeimFull2007';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% uni-variate data
% time-length
data.tL = [... %  time since birth (d), body length (cm)
0.004	0.368
1.067	0.369
1.998	0.392
3.063	0.417
4.061	0.446
5.124	0.433
5.990	0.474
7.055	0.513
8.053	0.535
9.115	0.526
10.048	0.570
11.113	0.597
12.109	0.595
13.172	0.590
14.036	0.598
15.102	0.638
16.099	0.639
17.030	0.670
18.095	0.696
19.026	0.709
20.091	0.748
21.092	0.822
23.155	0.879
24.087	0.910
25.085	0.931
26.150	0.961
27.150	1.022
28.079	1.007
29.150	1.143
30.080	1.148
35.072	1.304
40.195	1.429];
data.tL(:,2) = data.tL(:,2) * 1.05; % convert body length to total length
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KondMead2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Till TL = 17 mm planktontic';
metaData.bibkey.F1 = 'Wash2007';
F2 = 'Weight-length: Ww in g = 0.00871 * (TL in cm)^3.05';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4S8YG'; % Cat of Life
metaData.links.id_ITIS = '637953'; % ITIS
metaData.links.id_EoL = '46576641'; % Ency of Life
metaData.links.id_Wiki = 'Rhinogobius'; % Wikipedia
metaData.links.id_ADW = 'Rhinogobius_brunneus'; % ADW
metaData.links.id_Taxo = '186001'; % Taxonomicon
metaData.links.id_WoRMS = '282581'; % WoRMS
metaData.links.id_fishbase = 'Rhinogobius-brunneus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinogobius}}';
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
bibkey = 'KondMead2013'; type = 'Article'; bib = [ ... 
'author = {M. Kondo and K. Maeda and K. Hirashima and K. Tachihara}, ' ... 
'year = {2013}, ' ...
'title = {Comparative larval development of three amphidromous \emph{Rhinogobius species}, making reference to their habitat preferences and migration biology}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {64}, ' ...
'pages = {249-266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/RHINOGOBIUS-BRUNNEUS.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeimFull2007'; type = 'Misc'; bib = [ ...
'author = {Heimowitz, Paul and Fuller, Pam}, ' ...
'year = {2007}, ' ...
'howpublished = {\url{http://depts.washington.edu/oldenlab/wordpress/wp-content/uploads/2013/03/Rhinogobius-brunneus_2007R.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

