function [data, auxData, metaData, txtData, weights] = mydata_Callionymus_belcheri

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Callionymiformes'; 
metaData.family     = 'Callionymidae';
metaData.species    = 'Callionymus_belcheri'; 
metaData.species_en = 'Belcher''s dragonet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 06];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'John1972';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 7.5;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 10;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 5.1e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'John1972';
  comment.Wwb = 'based on egg diameter of 0.46 mm: pi/6*0.046^3';
data.Wwp = 2.08;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00708*Lp^2.82, see F1';
data.Wwi = 4.68;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^2.82, see F1';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm)
    0 5.4 5.6
    1 6.5 7.1
    2 8.3 8.8
    3 9.2 9.8];
data.tL_fm(:,1) = (1.2 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  treat.tL_fm = {1, {'female','male'}};
  temp.tL_fm = C2K(28.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'John1972';

% length-fecundity
data.LN = [ ... % total length (cm), frecundity (#)
    7.5 1045
    8.0 1425
    9.0 1710
    9.5 1710
   10.5 1548];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(28.3);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'John1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

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
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^2.82'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PR5D'; % Cat of Life
metaData.links.id_ITIS = '642660'; % ITIS
metaData.links.id_EoL = '46571276'; % Ency of Life
metaData.links.id_Wiki = 'Callionymus_belcheri'; % Wikipedia
metaData.links.id_ADW = 'Callionymus_belcheri'; % ADW
metaData.links.id_Taxo = '165105'; % Taxonomicon
metaData.links.id_WoRMS = '273164'; % WoRMS
metaData.links.id_fishbase = 'Callionymus-belcheri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Callionymus_belcheri}}';  
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
bibkey = 'John1972'; type = 'Article'; bib = [ ...
'doi = {10.2307/1442917}, ' ...
'author = {Clifford Ray Johnson}, ' ...
'year = {1972}, ' ...
'title = {Biology and Ecology of \emph{Callionymus belcheri} ({P}isces: {C}allionymidae)}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1972(3)}, '...
'pages = {461–470}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Callionymus-belcheri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

