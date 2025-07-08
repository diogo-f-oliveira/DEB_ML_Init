  function [data, auxData, metaData, txtData, weights] = mydata_Chrosomus_neogaeus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chrosomus_neogaeus'; 
metaData.species_en = 'Finescale dace'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'dLp'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 16]; 

%% set data
% zero-variate data
data.ab = 6+7;   units.ab = 'd';  label.ab = 'age at birth';                      bibkey.ab = 'Stas1978';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 6 d, first feeding at 7 d post hatch';
data.tp = 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';      bibkey.tp = 'Stas1978';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.9;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Stas1978';
  comment.Lp = 'based on SL 4.1 cm and F2';
data.Li = 10.2;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'Stas1978';
  comment.Li = 'based on SL 8.5 cm and F2';

data.Wwb = 1.4e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Stas1978';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 1.18;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 11.7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

data.Ri = 3060/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.dLp = 7.6/365/0.83; units.dLp = 'cm/d';  label.dLp = 'change in TL at p';  bibkey.dLp = 'Stas1978';
  temp.dLp = C2K(20); units.temp.dLp = 'K'; label.temp.dLp = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight Ww in g = 0.00813 * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length - length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5YHXV'; % Cat of Life
metaData.links.id_ITIS = '913995'; % ITIS
metaData.links.id_EoL = '208318'; % Ency of Life
metaData.links.id_Wiki = 'Chrosomus_neogaeus'; % Wikipedia
metaData.links.id_ADW = 'Chrosomus_neogaeus'; % ADW
metaData.links.id_Taxo = '43626'; % Taxonomicon
metaData.links.id_WoRMS = '1020838'; % WoRMS
metaData.links.id_fishbase = 'Chrosomus-neogaeus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chrosomus_neogaeus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrosomus-neogaeus.html}}';  
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
bibkey = 'Stas1978'; type = 'article'; bib = [ ...  
'doi = {10.1577/1548-8659(1978)107<720:RAAGOT>2.0.CO;2}, ' ...
'author = {Richard H. Stasiak}, ' ...
'year = {1978}, ' ...
'title = {Reproduction, Age, and Growth of the Finescale Dace, \emph{Chrosomus neogaeus}, in {M}innesota}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {107(5)}, '...
'pages = {720-723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

