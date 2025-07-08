function [data, auxData, metaData, txtData, weights] = mydata_Cottus_bairdii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_bairdii'; 
metaData.species_en = 'Mottled sculpin'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 6 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Bail1952';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.45;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Patt1971'; 
data.Li  = 12.75;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = {'fishbase','Bail1952'};
  comment.Li = 'based on largest female of TL 9.35 cm, and male 11 cm in Bail1952: 15*9.35/11';
data.Lim  = 15;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 0.76;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = {'fishbase','ADW'};
  comment.Wwi = 'based on 0.00708*Lp^3.13, see F1';
data.Wwi = 20.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'fishbase','ADW'};
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';
data.Wwim = 33.97;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00708*Lim^3.13, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 4.85
    2 6.61
    3 8.16
    4 9.00
    5 9.35];
data.tL_f(:,1) = 365 * (1 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bail1952';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1  5.7
    2  7.07
    3  8.31
    4 10.37
    5 11.00];
data.tL_m(:,1) = 365 * (1 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bail1952';
comment.tL_m = 'data for males';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.481	60.219
4.601	51.826
4.613	42.811
4.697	52.447
4.782	64.488
4.830	37.443
4.890	53.688
4.902	59.702
4.986	48.296
4.986	52.505
4.998	72.347
5.010	45.295
5.010	60.926
5.010	67.539
5.034	56.121
5.106	50.725
5.178	54.347
5.178	51.942
5.311	68.201
5.311	62.790
5.503	53.811
5.503	59.823
5.503	83.871
5.587	54.429
5.587	69.459
5.623	64.055
5.695	45.432
5.876	65.909
5.900	90.563
5.996	53.909
6.008	61.126
6.309	72.008
6.405	61.206
6.826	94.356
7.174	110.057
7.283	147.354
7.463	120.336
7.547	102.918
7.583	59.638
7.583	88.496
7.691	110.161
7.872	165.508
7.896	176.334
7.956	122.238
8.076	118.054
8.088	147.515
8.088	112.044
8.100	98.219
8.184	172.184
8.485	210.120
8.810	199.363
9.110	276.377];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Patt1971';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Lp = weights.Lp * 5;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYFS'; % Cat of Life
metaData.links.id_ITIS = '167237'; % ITIS
metaData.links.id_EoL = '205848'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_bairdii'; % Wikipedia
metaData.links.id_ADW = 'Cottus_bairdii'; % ADW
metaData.links.id_Taxo = '172052'; % Taxonomicon
metaData.links.id_WoRMS = '578660'; % WoRMS
metaData.links.id_fishbase = 'Cottus-bairdii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_bairdii}}';
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
bibkey = 'Bail1952'; type = 'Article'; bib = [ ... 
'author = {Jack E. Bailey}, ' ... 
'year = {1952}, ' ...
'title = {Life History and Ecology of the Sculpin \emph{Cottus bairdi punctulatus} in {S}outhwestern {M}ontana}, ' ...
'journal = {Copeia}, ' ...
'volume = {1952(4)}, ' ...
'pages = {243-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Patt1971'; type = 'Article'; bib = [ ... 
'author = {Benjamin G. Patten}, ' ... 
'year = {1971}, ' ...
'title = {Spawning and Fecundity of Seven Species of {N}orthwest {A}merican Cottus}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {85(2)}, ' ...
'pages = {493-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-bairdii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cottus_bairdii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

