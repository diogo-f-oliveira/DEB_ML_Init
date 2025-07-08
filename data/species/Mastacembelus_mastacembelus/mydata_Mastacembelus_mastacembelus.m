function [data, auxData, metaData, txtData, weights] = mydata_Mastacembelus_mastacembelus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Synbranchiformes'; 
metaData.family     = 'Mastacembelidae';
metaData.species    = 'Mastacembelus_mastacembelus'; 
metaData.species_en = 'Euphrates spiny eel'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 03];

%% set data
% zero-variate data

data.ab = 8; units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Avil2002';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 69;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'OymaKira2009';

data.Wwb = 6.6e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Avil2002';
  comment.Wwb = 'based on egg diameter of 2.33 mm: pi/6*0.233^3';

data.GSI = 0.12; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'Avil2002';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 1 NaN   7
 2 29.0 32.5
 3 38.2 39.5
 4 41.8 42.7
 5 49.8 53.9
 6 53.5 58.7
 7 59.7 63.2
 8 63.3 67.1
 9 65.3 68.1
10 NaN  72.5
11 NaN  74.3
12 NaN  77.5
13 NaN  82];
data.tL_fm(:,1) = 365 * (0.8 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'OymaKira2009'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
 1 NaN    6
 2  66   70
 3 120  122
 4 180  192
 5 302  322
 6 368  417
 7 475  537
 8 579  662
 9 620  746
10 NaN  871
11 NaN  957
12 NaN 1032
13 NaN 1100];
data.tW_fm(:,1) = 365 * (0.8 + data.tW_fm(:,1));  % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(22);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'OymaKira2009'; treat.tW_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00324*(TL in cm)^2.84';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3YCKR'; % Cat of Life
metaData.links.id_ITIS = '650131'; % ITIS
metaData.links.id_EoL = '223074'; % Ency of Life
metaData.links.id_Wiki = 'Mastacembelus'; % Wikipedia
metaData.links.id_ADW = 'Mastacembelus_mastacembelus'; % ADW
metaData.links.id_Taxo = '179622'; % Taxonomicon
metaData.links.id_WoRMS = '1022996'; % WoRMS
metaData.links.id_fishbase = 'Mastacembelus-mastacembelus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mastacembelus}}';
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
bibkey = 'OymaKira2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2009.01234.x}, ' ...
'author = {Oymak, S.A. and G. Kirankaya and N. Dogan}, ' ... 
'year = {2009}, ' ...
'title = {Growth and reproduction of {M}esopotamian spiny eel (\emph{Mastacembelus mastacembelus} {B}anks \& {S}olander, 1794) in {A}taturk {D}am {L}ake (\c{S}anliurfa), {T}urkey}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {25}, ' ...
'pages = {488-490}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Mastacembelus-mastacembelus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
