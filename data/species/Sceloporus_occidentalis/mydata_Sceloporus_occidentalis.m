function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_occidentalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_occidentalis'; 
metaData.species_en = 'Western fence lizard'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','t-JX'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 31];


%% set data
% zero-variate data

data.ab = 52+10;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on S. undulatus';
data.am = 6*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on S. undulatus';

data.Lb  = 2.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';    bibkey.Lb  = {'Tink1972','TinkBall1972'}; 
  comment.Lb = 'Data for S. undulatus';
data.Lp  = 5.8;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = {'Tink1972','TinkBall1972'};
  comment.Lp = 'Data for S. undulatus';
data.Li  = 8;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'Wiki';
  comment.Li = '5.7 till 8.9 cm';

data.Wwb = 0.75;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'RichTale2008';
data.Wwp = 6.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Tink1972','TinkBall1972'};
  comment.Wwb = 'Data for S. undulatus';
data.Wwi = 18;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'Tink1972','TinkBall1972'};
  comment.Wwi = 'Data for S. undulatus';

data.Ri  = 16/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.tW = '3 till 17 eggs per clutch, 1 till 3 clutches per yr';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0	0.7473
7	0.8845
14	1.4031
21	1.8224
28	2.3715
35	2.7603
42	3.3780];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(30);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RichTale2008';
comment.tW = 'Temperature between 26 and 35 C; fed on mealworm';
%
% t-JX data
data.tJX = [ ... % time since birth (d), mealworm consumption (g/d)
0	0.07
7	0.15
14	0.16
21	0.17
28	0.17
35	0.16
42	0.18];
units.tJX   = {'d', 'g/d'};  label.tJX = {'time since birth', 'mealworm consumption'};  
temp.tJX    = C2K(30);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
bibkey.tJX = 'RichTale2008';
comment.tJX = 'Temperature between 26 and 35 C';

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

%% Discussion points
D1 = 'This entry is discussed in Kear2012';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4V5B2'; % Cat of Life
metaData.links.id_ITIS = '173875'; % ITIS
metaData.links.id_EoL = '790717'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_occidentalis'; % ADW
metaData.links.id_Taxo = '49020'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=occidentalis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_occidentalis}}';
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
bibkey = 'RichTale2008'; type = 'Article'; bib = [ ... 
'author = {C. N. Rich and L. G. Talen}, ' ... 
'year = {2008}, ' ...
'title = {The Effects of Prey Species on Food Conversion Efficiency and Growth of an Insectivorous Lizard}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {27}, ' ...
'pages = {181-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tink1972'; type = 'Article'; bib = [ ... 
'author = {Tinkle, D. W.}, ' ... 
'year = {1972}, ' ...
'title = {The dynamics of a Utah population of \emph{Sceloporus undulatus}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {28}, ' ...
'pages = {351-359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TinkBall1972'; type = 'Article'; bib = [ ... 
'author = {Tinkle, D. W. and Ballinger, R. E.}, ' ... 
'year = {1972}, ' ...
'title = {Sceloporus undulatus: a study of the intraspecific comparative demography of a lizard}, ' ...
'journal = {Ecology}, ' ...
'volume = {53}, ' ...
'pages = {570-584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
