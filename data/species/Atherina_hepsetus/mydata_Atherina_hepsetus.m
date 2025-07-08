function [data, auxData, metaData, txtData, weights] = mydata_Atherina_hepsetus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinidae';
metaData.species    = 'Atherina_hepsetus'; 
metaData.species_en = 'Mediterranean sand smelt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm','MAbl'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 25];

%% set data
% zero-variate data

data.ab = 26;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Atherina_presbyter';
data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.ap = 'based on Atherina_presbyter';
data.am = 5*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Atherina_presbyter: 6.8*20/21 cm';
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.24e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.75;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00550*Lp^3.08, see F1';
data.Wwi = 55.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.08, see F1';

data.GSI = 0.0918; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KutsSamo2022';
  temp.GSI = C2K(19); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ... time since hatch (yr), length (cm)
    1 11.30 11.15
    2 13.19 13.14
    3 14.28 14.23
    4 15.01 15.17];
data.tL_fm(:,1) = (0.7+data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'}; 
temp.tL_fm    = C2K(19);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KutsSamo2022';  treat.tL_fm = {1, {'females','males'}};

% time-weight
data.tW_fm = [ ... time since hatch (yr), length (cm)
    1  9.04  8.71
    2 14.83 14.42
    3 19.01 19.55
    4 21.86 21.90];
data.tW_fm(:,1) = (0.7+data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'}; 
temp.tW_fm    = C2K(19);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'KutsSamo2022'; treat.tW_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;
weights.tp = weights.tp * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '688Y5'; % Cat of Life
metaData.links.id_ITIS = '166023'; % ITIS
metaData.links.id_EoL = '46566596'; % Ency of Life
metaData.links.id_Wiki = 'Atherina_hepsetus'; % Wikipedia
metaData.links.id_ADW = 'Atherina_hepsetus'; % ADW
metaData.links.id_Taxo = '44695'; % Taxonomicon
metaData.links.id_WoRMS = '272028'; % WoRMS
metaData.links.id_fishbase = 'Atherina-hepsetus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Atherina_hepsetus}}'];
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
bibkey = 'KutsSamo2022'; type = 'Article'; bib = [ ... 
'author = {Dmitry Kutsyn and Iuliia Samotoy}, ' ... 
'year = {2022}, ' ...
'title = {Age, growth, reproduction and mortality of {M}editerranean sand smelt \emph{Atherina hepsetus} ({A}therinidae) from the {C}rimea region (the {B}lack {S}ea)}, ' ...
'journal = {Regional Studies in Marine Science}, ' ...
'volume = {52}, ' ...
'pages = {102235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Atherina-hepsetus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

