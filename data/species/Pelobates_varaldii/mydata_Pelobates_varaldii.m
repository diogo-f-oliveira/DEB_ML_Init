function [data, auxData, metaData, txtData, weights] = mydata_Pelobates_varaldii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pelobatidae';
metaData.species    = 'Pelobates_varaldii'; 
metaData.species_en = 'Moroccan spadefoot'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTi', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 16];

%% set data
% zero-variate data

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'GuarAndr2011';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'GuarAndr2011';
  temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'CogaRosi2014';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp 11-34 C';

data.Lj  = 2.7;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'amphibiaweb'; 
  comment.Lj = '21-34 mm';
data.Li  = 7.0;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim = 6.5;  units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'Wiki';

data.Wwb = 3.1e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter 1.15-2.0 mm: pi/6*0.18^3';
data.Wwi = 39.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'GuarAndr2011';
  comment.Wwi = 'based on 5.28 cm weighs 17 g: (7/5.28)^3*17';
data.Wwim = 31.4;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'GuarAndr2011';
  comment.Wwim = 'based on 5.17 cm weighs 15.8 g: (6.5/5.17)^3*15.8';

data.Ri  = 1570/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on P. syriacus: 31.4/120*6000 per yr';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
 2	4.837 4.660
 2	4.473 4.529
 3	5.033 5.005
 3	4.753 4.865
 3	4.613 4.622
 3  NaN   4.585
 3  NaN   4.772
 3  NaN   4.716
 3  NaN   4.380
 3  NaN   4.324
 4	5.210 5.247
 4	5.117 5.872
 4	4.986 5.573
 4  NaN   4.734
 4  NaN   5.443
 4  NaN   5.079
 4  NaN   4.995
 4  NaN   5.331
 4  NaN   5.145
 5	5.219 5.182
 5	5.601 5.527
 5	5.294 5.480
 5  NaN   5.443
 5  NaN   5.387
 5  NaN   5.107
 5  NaN   4.883
 5  NaN   5.275
 6	5.918 5.396
 6  NaN   6.124
 6  NaN   5.592
 6  NaN   5.471
 6  NaN   5.284
 6  NaN   5.284
 6  NaN   5.042
 7	6.403 5.573
 7  NaN   5.452
 7  NaN   5.974
 8	5.881 NaN
 9	6.189 NaN
10	5.620 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.8)  * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm    = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'GuarAndr2011'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '76CZL'; % Cat of Life
metaData.links.id_ITIS = '664732'; % ITIS
metaData.links.id_EoL = '333352'; % Ency of Life
metaData.links.id_Wiki = 'Pelobates_varaldii'; % Wikipedia
metaData.links.id_ADW = 'Pelobates_varaldii'; % ADW
metaData.links.id_Taxo = '47559'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelobates+varaldii'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelobates_varaldii}}';
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
bibkey = 'GuarAndr2011'; type = 'Article'; bib = [ ... 
'doi = {10.1163/017353711x605678}, ' ...
'author = {Maria Guarino, F. and Andreone, F. and de Pous, P. and Crottini, A. and Mezzasalma, M.}, ' ... 
'year = {2011}, ' ...
'title = {Age structure and growth in a population of \emph{Pelobates varaldii} ({A}nura, {P}elobatidae) from northwestern {M}orocco}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {32(4)}, ' ...
'pages = {550–556}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pelobates+varaldii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
