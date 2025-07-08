function [data, auxData, metaData, txtData, weights] = mydata_Macroramphosus_scolopax

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Centriscidae';
metaData.species    = 'Macroramphosus_scolopax'; 
metaData.species_en = 'Longspine snipefish'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0pMp', 'piMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 03]; 

%% set data
% zero-variate data

data.ab = 6.5;      units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 547;     units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'guess';
  temp.ap = C2K(16);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 6 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EOL';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8.4;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 16.8;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'Borg2000';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'saiab';
  comment.Wwb = 'based on egg diameter of 865-985 mum: 0.0450^3 * pi* 4/ 3'; 
data.Wwp = 3.1;   units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'guess';
  comment.Wwp = 'Computed as 0.00401 * Lp^3.127'; 
data.Wwi = 27.2;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Borg2000';
  comment.Wwi = 'Computed as 0.00401 * Li^3.127'; 

data.Ri  = 35; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kappa = 0.85';
 
% uni-variate data
% t-L data
data.tL = [... % time (yr), standard length (cm)
0  7.8
1 12.44
2 13.73
3 14.25
4 15.09
5 16.11
6 16.67]; 
data.tL(:,1) = (1 + data.tL(:,1)) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Borg2000';
comment.tL = 'temp is guessed'; 
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'W = 0.00401 * L^3.127 g, L = standard length in cm';
metaData.bibkey.F1 = 'Borg2000'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3X97J'; % Cat of Life
metaData.links.id_ITIS = '551497'; % ITIS
metaData.links.id_EoL = '46567475'; % Ency of Life
metaData.links.id_Wiki = 'Macroramphosus_scolopax'; % Wikipedia
metaData.links.id_ADW = 'Macroramphosus_scolopax'; % ADW
metaData.links.id_Taxo = '179479'; % Taxonomicon
metaData.links.id_WoRMS = '127378'; % WoRMS
metaData.links.id_fishbase = 'Macroramphosus-scolopax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macroramphosus_scolopax}}';
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
bibkey = 'Borg2000'; type = 'Article'; bib = [ ... 
'author = {Borges, L.}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of the snipefish, \emph{Macrorhamphosus spp.}, in the {P}ortuguese continental waters}, ' ...
'journal = {J. Mar. Biol. Ass. UK}, ' ...
'volume = {80}, ' ...
'pages = {147--153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuraSasa2000'; type = 'Article'; bib = [ ... 
'author = {I. Kuranaga and K. Sasaki}, ' ... 
'year = {2000}, ' ...
'title = {Larval development in a snipefish (\emph{Macroramphosus scolopax}) from {J}apan with notes on eastern {P}acific and {M}editerranean \emph{Macroramphosus} larvae ({G}asterosteiformes, {M}acroramphosidae)}, ' ...
'journal = {Ichthyol. Res.}, ' ...
'volume = {47}, ' ...
'pages = {101--106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Macroramphosus_scolopax/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/333}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EOL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/205113/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'saiab'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fisheggs-and-larvae.saiab.ac.za/LIIIE5~Macroramphosidae.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];