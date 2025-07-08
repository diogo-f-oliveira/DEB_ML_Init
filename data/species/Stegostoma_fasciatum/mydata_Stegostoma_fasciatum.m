function [data, auxData, metaData, txtData, weights] = mydata_Stegostoma_fasciatum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Stegostomatidae';
metaData.species    = 'Stegostoma_fasciatum'; 
metaData.species_en = 'Zebra shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'T-ab'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 07 17]; 

%% set data
% zero-variate data;
data.tp = 6*365;   units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'WatsJans2017';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33*365;  units.am = 'd';   label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 28.7; units.Lb  = 'cm'; label.Lb  = 'total length at birth';  bibkey.Lb  = 'WatsJans2017';
  comment.Lb = '15-32 g';
data.Lp  = 213;     units.Lp = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'WatsJans2017';
data.Lpm  = 208;     units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'WatsJans2017';
data.Li  = 300 ;     units.Li = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
data.Lim  = 354 ;     units.Lim = 'cm';  label.Lim  = 'ultimate total length';  bibkey.Lim  = 'fishbase';
 comment.Lim = 'max length reported; might be male on the basis that males are larger than females (ADW)';

data.Wwb  = 90;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';        bibkey.Wwb  = 'WatsJans2017';
  comment.Wwb = '50 - 130 g';
data.Wwp  = 47900;   units.Wwp  = 'g';  label.Wwp  = 'weight at puberty';        bibkey.Wwp  = 'WatsJans2017';
data.Wwpm  = 33900;   units.Wwpm  = 'g';  label.Wwpm  = 'weight at puberty for males';        bibkey.Wwpm  = 'WatsJans2017';
data.Wwim  = 2.2e5;   units.Wwim  = 'g';  label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'WatsJans2017','fishbase'};
  comment.Wwim = 'based on Lp, Wwp and Li data: 47900*(354/213)^3';

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'WatsJans2017';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'typical in aquaria 20-50 eggs per yr';

% uni-variate data

% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
25   157.4
25.5 160.4
26.5 124.2
28.3 119.9];
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'WatsJans2017';

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4ZP9X'; % Cat of Life
metaData.links.id_ITIS = '159973'; % ITIS
metaData.links.id_EoL = '46559739'; % Ency of Life
metaData.links.id_Wiki = 'Stegostoma_fasciatum'; % Wikipedia
metaData.links.id_ADW = 'Stegostoma_fasciatum'; % ADW
metaData.links.id_Taxo = '41866'; % Taxonomicon
metaData.links.id_WoRMS = '220032'; % WoRMS
metaData.links.id_fishbase = 'Stegostoma-fasciatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegostoma_fasciatum}}';  
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
bibkey = 'WatsJans2017'; type = 'incollection'; bib = [ ...
'author = {Lise Watson and Max Janse}, ' ...
'year = {2017}, ' ...
'title = {Reproduction and husbandry of zebra sharks, \emph{Stegostoma fasciatum}, in aquaria}, ' ...
'booktitle = {The Elasmobranch Husbandry Manual II: Recent Advances in the Care of Sharks, Rays and their Relatives}, ' ...
'publishet = {Ohio Biological Survey}, ' ...
'chapter = {41}, '...
'pages = {421-432}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/stegostoma-fasciatum}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Stegostoma_fasciatum/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
