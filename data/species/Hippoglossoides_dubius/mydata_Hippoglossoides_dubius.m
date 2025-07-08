function [data, auxData, metaData, txtData, weights] = mydata_Hippoglossoides_dubius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Hippoglossoides_dubius'; 
metaData.species_en = 'Flathead flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 18];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(3.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';

data.Lp  = 26;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'ChoiYoon2013'; 
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ChoiYoon2013';
  comment.Wwb = 'based on egg diameter of 0.9-1.4 mm: pi/6*0.12^3';
data.Wwp = 158;  units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';      bibkey.Wwp = {'fishbase','ChoiYoon2013'};
  comment.Wwp = 'based on 0.00741*Lp^3.06, see F1';
data.Wwi = 848.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.06, see F1';
 
% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), total length (cm)
    1  6.30  5.75
    2  9.83  9.06
    3 12.51 11.49
    4 14.74 13.38
    5 16.99 15.41
    6 19.21 17.35
    7 21.38 19.17
    8 23.76 21.11
    9 26.49 23.04
   10 29.23 25.09]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.8) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'age', 'total length'};  
temp.tL_fm = C2K(3.4); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'IwakTaka2013'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for 1995';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
25.627	46275.703
26.649	66998.076
27.734	13374.620
28.297	100669.410
31.887	96277.624
32.941	106750.344
33.408	332487.235
33.506	309430.508
33.707	432548.656
34.101	360834.471
34.132	299302.375
34.623	191710.780
35.092	486678.856
35.287	368770.041
35.384	330328.552
35.513	197021.462
35.614	273965.249
35.619	476530.453
35.841	148370.761
36.038	130462.558
36.181	556133.009
36.434	179261.806
36.436	225415.897
36.437	279262.418
36.537	307487.938
36.632	189558.854
36.700	243418.790
36.738	438298.419
36.811	692159.530
36.833	315241.080
36.865	263965.491
36.935	420390.216
37.029	235794.024
37.225	199936.883
37.390	212791.252
37.392	261509.519
37.395	369202.463
37.525	330767.730
37.625	374378.013
37.626	394890.932
37.684	102595.039
37.919	282130.543
37.921	356489.982
37.925	469311.083
38.025	512921.365
38.149	259100.842
38.152	338588.438
38.157	551410.150
38.181	205261.078
38.188	464236.881
38.215	236037.261
38.325	641187.988
38.348	312987.805
38.479	261732.486
38.617	513042.984
38.648	428433.890
38.686	628441.724
38.873	210531.221
38.874	256685.311
38.973	264397.913
39.068	138776.496
39.144	497766.425
39.272	377279.921
39.402	313204.016
39.768	426099.439
39.897	336382.459
39.964	362037.145
39.996	328710.299
40.262	426200.788
40.356	251861.104
40.557	382671.682
40.950	305829.243
41.842	372678.681
42.384	918943.693
42.503	472814.425
42.902	613921.904
42.999	531890.451
43.263	549893.344
48.835	743343.904];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(3.4); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ChoiYoon2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 3 * weights.Lp;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
% set2 = {'tL_fC','tL_mC'}; subtitle2 = {'Data for females, males in Central California'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'I had to add 4 yrs for age estimates to arrive at a plausible fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00741*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3M259'; % Cat of Life
metaData.links.id_ITIS = '616041'; % ITIS
metaData.links.id_EoL = '46570097'; % Ency of Life
metaData.links.id_Wiki = 'Hippoglossoides_dubius'; % Wikipedia
metaData.links.id_ADW = 'Hippoglossoides_dubius'; % ADW
metaData.links.id_Taxo = '176721'; % Taxonomicon
metaData.links.id_WoRMS = '274288'; % WoRMS
metaData.links.id_fishbase = 'Hippoglossoides-dubius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippoglossina}}';
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
bibkey = 'IwakTaka2013'; type = 'article'; bib = [ ...
'author = {Iwakawa, K. and T. Takahashi and T. Takatsu and Y. Inagaki and T. Nakatani and T. Maeda}, ' ...
'year = {2013}, ' ...
'title = {Growth pattern of flathead flounder \emph{Hippoglossoides dubius} in {F}unka {B}ay, {H}okkaido, {J}apan}, ' ... 
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {79(1)}, ' ...
'pages = {10-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChoiYoon2013'; type = 'article'; bib = [ ...
'author = {Young Min Choi and Byoung Sun Yoon and Jeong-Ho Park and Kie Young Park and Myoung Ho Sohn and Jae Bong Lee and Jae Won Kim}, ' ...
'year = {2013}, ' ...
'title = {Maturation and Spawning of the Flathead Flounder \emph{Hippoglossoides dubius} off the coast of {G}angwon {P}rovince, {E}ast {S}ea of {K}orea}, ' ... 
'journal = {Kor. J. Fish. Aquat. Sci.}, ' ...
'volume = {79(1)46(6)}, ' ...
'pages = {835-842}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Hippoglossina_-stomata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

