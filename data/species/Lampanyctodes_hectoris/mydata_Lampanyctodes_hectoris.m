function [data, auxData, metaData, txtData, weights] = mydata_Lampanyctodes_hectoris
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Lampanyctodes_hectoris'; 
metaData.species_en = 'Hector''s lanternfish'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS', 'MPS', 'MIS'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 04 02]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 02]; 

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.6;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'Pros1991';
data.Li = 7.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'Wiki';

data.Wwb = 1.95e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Robe1977';
  comment.Wwb = 'based on egg length of 0.784 mm and egg width of 0.688 mm: 4/3*pi*0.0392*0.0344^2';
data.Wwp = 0.28; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00537 * Lp^3.08, see F4';
data.Wwi = 2.5;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00537 * Li^3.08, see F4';

data.Ri = 1.8e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'Pros1991';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on 3*1431*Wwi per spawn; 5 spawns assumed';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (yr) ~ Length (cm) 
0.036	1.916
0.045	1.788
0.046	2.892
0.047	3.857
0.057	2.517
0.059	2.281
0.065	3.177
0.068	3.305
0.070	3.384
0.070	4.645
0.074	3.502
0.077	2.675
0.080	4.025
0.081	3.286
0.082	3.828
0.088	3.709
0.090	3.532
0.091	3.897
0.092	4.813
0.092	4.409
0.095	3.394
0.096	4.685
0.096	4.094
0.097	4.517
0.098	3.818
0.098	4.921
0.101	3.384
0.105	3.581
0.107	5.433
0.108	5.128
0.108	4.842
0.109	4.527
0.109	4.300
0.109	4.133
0.113	4.429
0.117	4.931
0.117	4.793
0.118	4.310
0.118	3.985
0.119	3.581
0.120	4.714
0.122	3.857
0.124	3.700
0.124	5.128
0.126	4.212
0.129	4.094
0.132	3.975
0.132	4.911
0.133	3.700
0.134	4.606
0.135	4.833
0.140	5.030
0.143	4.281
0.145	4.527
0.146	4.764
0.150	4.182
0.151	4.911
0.162	5.128
0.162	5.000
0.162	4.882
0.164	5.345
0.168	5.217
0.171	5.522
0.220	5.532
0.220	5.315
0.220	5.207
0.220	5.000
0.221	5.099
0.272	5.404
0.272	5.315
0.274	5.128
0.274	5.000
0.278	5.542
0.385	5.542
0.386	5.680
0.386	5.345
0.386	5.236
0.386	5.010
0.387	6.094
0.387	6.025
0.387	5.916
0.387	5.808
0.387	6.399
0.387	6.222
0.388	5.099
0.389	6.507
0.443	6.409
0.444	5.315
0.445	6.192
0.445	6.015
0.497	6.813
0.497	6.714
0.497	6.586
0.497	6.488
0.497	6.379
0.500	6.202
0.556	6.409
0.610	6.754
0.610	6.616
0.610	6.498
0.612	6.094
0.666	6.478
0.667	5.315
0.722	6.793
0.722	6.655
0.723	6.498
0.831	7.010
0.833	6.892
0.833	6.773
0.944	7.010];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YounBulm1988';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 18 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Nyctoepipelagic';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g =  0.00537 * (L in cm)^3.08';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '3S2LX'; % Cat of Life
metaData.links.id_ITIS = '623730'; % ITIS
metaData.links.id_EoL = '46564277'; % Ency of Life
metaData.links.id_Wiki = 'Lampanyctodes_hectoris'; % Wikipedia
metaData.links.id_ADW = 'Lampanyctodes_hectoris'; % ADW
metaData.links.id_Taxo = '153098'; % Taxonomicon
metaData.links.id_WoRMS = '217704'; % WoRMS
metaData.links.id_fishbase = 'Lampanyctodes-hectoris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampanyctodes_hectoris}}';
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
bibkey = 'YounBulm1988'; type = 'article'; bib = [ ...
'author = {J. W. Young and C. M. Bulman and S. J. M. Blaber and S. E. Wayte}, ' ... 
'year   = {1988}, ' ...
'title  = {Age and growth of the lanternfish \emph{Lampanyctodes hectoris} ({M}yctophidae) from eastern {T}asmania, {A}ustralia}, ' ...
'journal = {Marine Biology}, ' ...
'page = {569--576}, ' ...
'volume = {99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pros1991'; type = 'article'; bib = [ ...
'author = {R. M. Prosch}, ' ... 
'year   = {1991}, ' ...
'title  = {REPRODUCTIVE BIOLOGY AND SPAWNING OF THE MYCTOPHID \emph{Lampanyctodes hectoris}  AND THE STERNOPTYCHID \emph{Maulicus muelleri} IN THE SOUTHERN {B}ENGUELA ECOSYSTEM}, ' ...
'journal = {S. Afr. J. mar. Sci.}, ' ...
'page = {241--252}, ' ...
'volume = {10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1977'; type = 'article'; bib = [ ...
'author = {Robertson, D. A.}, ' ... 
'year   = {1977}, ' ...
'title  = {Planktonic eggs of the lanternfish, \emph{Lampanyctodes  hectoris} (family {M}yctophidae)}, ' ...
'journal = {Deep-Sea Research}, ' ...
'page = {849--852}, ' ...
'volume = {24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/259}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

