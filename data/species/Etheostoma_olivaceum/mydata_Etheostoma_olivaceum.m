  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_olivaceum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_olivaceum'; 
metaData.species_en = 'Sooty darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
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
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'Page1980';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Page1980'; 
  comment.Lp = 'based on LN data';
data.Li = 8;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Page1980';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 3.51; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (mnth), std length (cm)
1.981	2.122
3.128	2.375
4.015	2.950
5.110	3.725
6.048	3.444
8.082	3.708
9.177	3.876
10.220	4.118
11.054	3.774
12.045	4.193
14.026	4.237
15.225	4.500
16.007	4.793
21.117	6.158
22.004	5.500
23.985	5.095
26.019	5.202];
data.tL_f(:,1) = 30.5 * (0 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.856; % convert SL to TL 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Page1980';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (mnth), std length (cm)
2.034	2.321
3.128	2.793
4.015	2.856
5.006	3.432
6.101	3.193
8.134	3.279
9.073	3.949
10.063	3.908
11.054	3.565
12.201	4.852
13.974	4.697
15.069	4.698
16.060	4.929
16.946	5.620
21.013	6.095
22.108	5.772
23.881	6.004
26.071	5.703
27.061	5.736];
data.tL_m(:,1) = 30.5 * (0 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.856; % convert SL to TL 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Page1980';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % std length (cm), frecundity (#)
    3.7 60
    4.0 73
    4.1 74
    4.2 90
    4.2 75
    4.4 98
    4.4 112
    4.4 69
    4.5 72];
data.LN(:,1) = data.LN(:,1)/ 0.856; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Page1980';

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
F2 = 'length-length from photo: SL = 0.856 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL5J'; % Cat of Life
metaData.links.id_ITIS = '168418'; % ITIS
metaData.links.id_EoL = '207261'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_olivaceum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_olivaceum'; % ADW
metaData.links.id_Taxo = '174127'; % Taxonomicon
metaData.links.id_WoRMS = '1012502'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-olivaceum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_olivaceum}}';  
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
bibkey = 'Page1980'; type = 'techreport'; bib = [ ...  
'author = {Lawrence M. Page }, ' ...
'year = {1980}, ' ...
'title = {The life histories of the \emph{Etheostoma olivaceum} and \emph{Etheostoma  striatulum}, two species of darters in central Tennessee}, ' ... 
'institution = {State of Illinois, Department of Registration and Education, NATURAL HISTORY SURVEY DIVISION}, ' ...
'volume = {113}, '...
'series = {ILLINOIS NATURAL HISTORY SURVEY, Biological Notes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-olivaceum}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
