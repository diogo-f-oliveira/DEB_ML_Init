  function [data, auxData, metaData, txtData, weights] = mydata_Mirogrex_terraesanctae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Mirogrex_terraesanctae'; 
metaData.species_en = 'Kinneret bream'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 14]; 

%% set data
% zero-variate data
data.am = 23*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'OstrWall1999'; 
data.Lpm = 9.6;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'OstrWall1999';
  comment.Lpm = 'based on same relative length as female';
data.Li = 24.78;    units.Li = 'cm'; label.Li = 'ultimate total length for females';   bibkey.Li = 'OstrWall1999';
data.Lim = 19.89;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males';  bibkey.Lim = 'OstrWall1999';

data.Wwb = 3.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwi = 168;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'OstrWall1999';
data.Wwim = 80.2;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'OstrWall1999';

data.Ri = 2.5e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'guess';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
    
% univariate data

% initial length-length after 1 yr
data.LL_f = [ ... % total length at t (cm), total length at t+1
8.115	12.911
12.909	16.283
16.303	18.586
18.594	20.395];
units.LL_f = {'cm', 'cm'}; label.LL_f = {'total length at t', 'total length at t + 1 yr', 'female'};  
temp.LL_f = C2K(23);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'OstrWall1999';
comment.LL_f = 'data for females';
%
data.LL_m = [ ... % total length at t (cm), total length at t+1
7.669	12.145
11.864	14.587
14.407	16.436];
units.LL_m = {'cm', 'cm'}; label.LL_m = {'total length at t', 'total length at t + 1 yr', 'male'};  
temp.LL_m = C2K(23);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'OstrWall1999';
comment.LL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.LL_f = 5 * weights.LL_f;
weights.LL_m = 5 * weights.LL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f', 'LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '43MBM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '49803409'; % Ency of Life
metaData.links.id_Wiki = 'Mirogrex_terraesanctae'; % Wikipedia
metaData.links.id_ADW = 'Mirogrex_terraesanctae'; % ADW
metaData.links.id_Taxo = '469554'; % Taxonomicon
metaData.links.id_WoRMS = '1014158'; % WoRMS
metaData.links.id_fishbase = 'Mirogrex-terraesanctae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acanthobrama_terraesanctae}}';  
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
bibkey = 'OstrWall1999'; type = 'Article'; bib = [ ...  
'author = {I. Ostrovsky and P. Walline}, ' ...
'year = {1999}, ' ...
'title = {Growth and production of the dominant pelagic fish, \emph{Acanthobrama terraesanctae}, in subtropical {L}ake {K}inneret, {I}srael}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {54}, ' ...
'pages = {18-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mirogrex-terraesanctae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

