  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_smithi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_smithi'; 
metaData.species_en = 'Slabrock darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.ab = 21;   units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'PageBurr1976';   
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 13 d, start feeding at 8 d post-hatch ';
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'PageBurr1976';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.98;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'PageBurr1976'; 
  comment.Lp = 'based on LN data';
data.Li = 6.2;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 5.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PageBurr1976';
  comment.Wwb = 'based on egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwi = 1.58; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (mnth), std length (cm)
2.010	1.312
3.157	1.735
3.951	1.948
5.112	2.125
6.164	2.302
7.035	2.433
7.943	2.555
9.073	2.650
9.985	2.708
11.133	3.123
12.084	3.126
13.042	3.029
13.973	3.397
15.072	3.392
16.058	3.441
17.111	3.582
18.096	3.658
19.037	3.844
20.110	3.647
21.069	3.532
22.154	3.773
23.107	4.378];
data.tL_f(:,1) = 30.5 * (0 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.84; % convert SL to TL 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PageBurr1976';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (mnth), std length (cm)
2.149	1.440
3.152	1.836
4.164	2.049
5.025	2.362
6.079	2.494
7.188	2.315
8.131	2.483
9.185	2.605
10.135	2.654
11.053	3.232
12.108	3.354
13.161	3.495
14.063	3.735
15.028	4.131
16.024	4.007
17.126	3.947
18.023	4.278
19.079	4.364
20.152	4.185
21.149	4.043
22.195	3.691
23.106	5.017
24.076	4.719];
data.tL_m(:,1) = 30.5 * (0 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.84; % convert SL to TL 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PageBurr1976';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % std length (cm), frecundity (#)
2.8 17
2.8 27
2.8 33
2.9 20
3.0 31
3.0 27
3.1 34
3.1 19
3.1 44
3.3 54
3.3 53
3.4 36
3.4 45
3.5 49
3.7 41
4.0 43
4.1 37
3.8 50
4.3 69];
data.LN(:,1) = data.LN(:,1)/ 0.84; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PageBurr1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Li =  5 * weights.Li;
weights.Wwi =  5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL6Y'; % Cat of Life
metaData.links.id_ITIS = '168435'; % ITIS
metaData.links.id_EoL = '207268'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_smithi'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_smithi'; % ADW
metaData.links.id_Taxo = '174153'; % Taxonomicon
metaData.links.id_WoRMS = '1012786'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-smithi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_smithi}}';  
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
bibkey = 'PageBurr1976'; type = 'techreport'; bib = [ ...  
'author = {Lawrence M. Page and Brooks M. Burr}, ' ...
'year = {1976}, ' ...
'title = {The life history of the slabrock darter, \emph{Etheostoma smithi}, in Ferguson Creek, Kentucky}, ' ... 
'institution = {State of Illinois, Department of Registration and Education, NATURAL HISTORY SURVEY DIVISION}, ' ...
'volume = {99}, '...
'series = {ILLINOIS NATURAL HISTORY SURVEY, Biological Notes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-smithi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
