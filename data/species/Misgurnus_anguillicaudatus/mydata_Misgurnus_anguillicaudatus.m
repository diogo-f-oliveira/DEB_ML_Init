  function [data, auxData, metaData, txtData, weights] = mydata_Misgurnus_anguillicaudatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Misgurnus_anguillicaudatus'; 
metaData.species_en = 'Pond loach'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb','Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 31];

%% set data
% zero-variate data
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Misgurnus fossilis';

data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty';   bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on Misgurnus fossilis';
data.Li = 28;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'Egg diameter of 1.24 mm of Misgurnus fossilis: pi/6*0.124^3';
data.Wwp = 7.88;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00525*Lp^3.05, see F1';
data.Wwi = 136; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00525*Li^3.05, see F1';

data.Ri = 2000/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate at TL = 23 cm';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm2n = [ ... % time since birth (yr), total length (cm) for female, male
0	5.21  5.21
1   6.68  6.52
2  10.12  9.26
3  13.34 12.45
4  15.79 13.88];
data.tL_fm2n(:,1) = (.9 + data.tL_fm2n(:,1)) * 365; % convert yr to d
units.tL_fm2n = {'d', 'cm'}; label.tL_fm2n = {'time since birth', 'total length'};  
temp.tL_fm2n = C2K(16);  units.temp.tL_fm2n = 'K'; label.temp.tL_fm2n = 'temperature';
treat.tL_fm2n = {1 {'female','male'}}; label.treat.tL_fm2n = 'diploid';
bibkey.tL_fm2n = 'FengYi2017'; title.tL_fm2n = 'diploids';
comment.tL_fm2n = 'Data for diploid females, males';
%
data.tL_fm4n = [ ... % time since birth (yr), total length (cm)
0  5.70  5.70
1  7.52  7.20
2 11.41 11.35
3 14.49 13.86
4 16.45 15.09
5 17.98 NaN];
data.tL_fm4n(:,1) = (.5 + data.tL_fm4n(:,1)) * 365; % convert yr to d
units.tL_fm4n = {'d', 'cm'}; label.tL_fm4n = {'time since birth', 'total length'};  
temp.tL_fm4n = C2K(16);  units.temp.tL_fm4n = 'K'; label.temp.tL_fmNR = 'temperature';
treat.tL_fm4n = {1 {'female','male'}}; label.treat.tL_fm4n = 'tetraploid';
bibkey.tL_fm4n = 'FengYi2017'; title.tL_fm4n = 'tetraploids';
comment.tL_fm4n = 'Data for tetrapoid females, males';

% time-weight
data.tW_fm2n = [ ... % time since birth (yr), weight (g) for female, male
0  1.0  1.0
1  2.1  2.1
2  7.9  6.2
3 16.5 13.5
4 24.5 19.3];
data.tW_fm2n(:,1) = (.5 + data.tW_fm2n(:,1)) * 365; % convert yr to d
units.tW_fm2n = {'d', 'g'}; label.tW_fm2n = {'time since birth', 'weight'};  
temp.tW_fm2n = C2K(16);  units.temp.tW_fm2n = 'K'; label.temp.tW_fm2n = 'temperature';
treat.tW_fm2n = {1 {'female','male'}}; label.treat.tW_fm2n = 'diploid';
bibkey.tW_fm2n = 'FengYi2017'; title.tW_fm2n = 'diploids';
comment.tW_fm2n = 'Data for diploid females, males';
%
data.tW_fm4n = [ ... % time since birth (yr), total length (cm)
0  1.4  1.4
1  3.4  3.5
2 12.0 11.8
3 19.3 15.8
4 31.5 23.2
5 44.6 NaN];
data.tW_fm4n(:,1) = (.5 + data.tW_fm4n(:,1)) * 365; % convert yr to d
units.tW_fm4n = {'d', 'cm'}; label.tW_fm4n = {'time since birth', 'weight'};  
temp.tW_fm4n = C2K(16);  units.temp.tW_fm4n = 'K'; label.temp.tW_fmNR = 'temperature';
treat.tW_fm4n = {1 {'female','male'}}; label.treat.tW_fm4n = 'tetraploid';
bibkey.tW_fm4n = 'FengYi2017'; title.tW_fm4n = 'tetraploids';
comment.tW_fm4n = 'Data for tetrapoid females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm2n = 3 * weights.tL_fm2n;
weights.tL_fm4n = 3 * weights.tL_fm4n;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.title = title;

%% Discussion points
D1 = 'Males are assumed to differ from females and diploids from tetraploids by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00525*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43NK4'; % Cat of Life
metaData.links.id_ITIS = '163978'; % ITIS
metaData.links.id_EoL = '204281'; % Ency of Life
metaData.links.id_Wiki = 'Misgurnus_anguillicaudatus'; % Wikipedia
metaData.links.id_ADW = 'Misgurnus_anguillicaudatus'; % ADW
metaData.links.id_Taxo = '43984'; % Taxonomicon
metaData.links.id_WoRMS = '991279'; % WoRMS
metaData.links.id_fishbase = 'Misgurnus-anguillicaudatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Misgurnus_anguillicaudatus}}';  
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
bibkey = 'FengYi2017'; type = 'Article'; bib = [ ...  
'doi = {10.1007/s10641-017-0608-z}, ' ...
'author = {Feng, B. and Yi, S. V. and Li, R. and Zhou, X.}, ' ...
'year = {2017}, ' ...
'title = {Comparison of age and growth performance of diploid and tetraploid loach \emph{Misgurnus anguillicaudatus} in the {Y}angtze {R}iver basin, {C}hina}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {100(7)}, '...
'pages = {815–828}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Misgurnus-anguillicaudatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

