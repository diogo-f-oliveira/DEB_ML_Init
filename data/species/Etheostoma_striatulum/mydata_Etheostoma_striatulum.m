  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_striatulum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_striatulum'; 
metaData.species_en = 'Striated darter'; 

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

data.Lp = 2.7;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Page1980'; 
  comment.Lp = 'based on LN data';
data.Li = 5.6;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Page1980';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 1.15; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (mnth), std length (cm)
2.008	1.902
3.063	2.299
4.120	2.448
5.084	2.753
6.137	3.279
8.112	3.742
9.033	3.734
10.046	3.643
11.106	3.451
12.070	3.729
13.958	3.648
15.106	3.944
17.038	4.030];
data.tL_f(:,1) = 30.5 * (0 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.816; % convert SL to TL 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Page1980';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (mnth), std length (cm)
2.007	2.003
3.064	2.180
4.072	2.632
5.079	3.204
6.138	3.187
7.979	3.153
9.032	3.835
10.042	4.048
11.103	3.820
11.973	4.355
14.002	3.832
15.057	4.248
16.211	3.937];
data.tL_m(:,1) = 30.5 * (0 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.816; % convert SL to TL 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Page1980';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % std length (cm), frecundity (#)
    3.1 19
    3.3 31
    3.5 45
    3.5 46
    3.7 59
    3.7 61
    3.8 108
    3.9 45
    4.1 30
    4.3 92];
data.LN(:,1) = data.LN(:,1)/ 0.816; % convert SL to TL
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
F2 = 'length-length from photo: SL = 0.816 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL7C'; % Cat of Life
metaData.links.id_ITIS = '168438'; % ITIS
metaData.links.id_EoL = '223380'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_striatulum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_striatulum'; % ADW
metaData.links.id_Taxo = '174157'; % Taxonomicon
metaData.links.id_WoRMS = '1012696'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-striatulum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_striatulum}}';  
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
'series = {Illinois Natural History Survey, Biological Notes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-striatulum}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
