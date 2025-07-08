function [data, auxData, metaData, txtData, weights] = mydata_Coptodon_guineensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Coptodon_guineensis'; 
metaData.species_en = 'Guinean tilapia'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab';'am';'Lp';'Li';'Wwb';'Wwi';'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 03 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 19];

%% set data
% zero-variate data

data.ab = 6; units.ab = 'd'; label.ab = 'age at birth; age at swimup'; bibkey.ab = 'guess'; 
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Coptodon_rendalli';
data.am = 16 * 365; units.am = 'd'; label.am = 'life span'; bibkey.am = 'guess'; 
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Coptodon_rendalli';

data.Lp  = 17.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'AyoaBaba2017'; 
data.Lpm  = 16.9;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'AyoaBaba2017'; 
data.Li  = 29.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'AyoaBaba2017';

data.Wwb  = 2.3e-3; units.Wwb  = 'g';  label.Wwb  = 'initial egg weight'; bibkey.Wwb  = 'guess'; 
  comment.Wwb = 'based on egg diameter 1.3-1.8 mm for Coptodon_rendalli: pi/6*0.163^3';
data.Wwi = 628.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AyoaBaba2017';

data.Ri  = 9852/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at TL 29.7 cm, 575.3g';  bibkey.Ri  = 'AyoaBaba2017'; 
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time - length
data.tL = [ ...    % time (d), total length (cm)
730+3.593	13.887
730+33.716	14.795
730+64.972	15.480
730+95.858	15.567
730+123.346	16.324
730+156.871	16.264
730+185.482	17.544
730+214.872	16.884
730+244.632	16.673
730+279.690	14.523
730+304.503	18.264
730+337.320	14.621
1095+3.175	17.245
1095+32.560	16.884
1095+64.552	18.912
1095+96.199	18.403
1095+121.816	18.190
1095+157.195	20.443
1095+185.484	17.395
1095+214.819	21.063
1095+279.601	21.612
1095+304.491	19.234
1095+338.374	20.666
1460+ 34.742	23.079
1460+279.916	26.463
1460+304.424	24.607
1460+337.547	26.561
1825+96.467	    27.060
1825+157.098	28.204];
data.tL(:,1) = data.tL(:,1)-230;    % set origin at hatch
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ayoa2015'; comment.tL = 'data from length-frequency counts in Asejire Lake';

data.tW = [ ... time (d), weight (g)
 0	29.197
14	40.292
28	44.964
42	49.635
56	54.307
70	60.730];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW    = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AsasAcol2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;
% weights.Li = 3 * weights.Li;
% weights.Lp = 3 * weights.Lp;
% weights.Lpm = 3 * weights.Lpm;
% weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'Y7LP'; % Cat of Life
metaData.links.id_ITIS = '648987'; % ITIS
metaData.links.id_EoL = '52229153'; % Ency of Life
metaData.links.id_Wiki = 'Coptodon'; % Wikipedia
metaData.links.id_ADW = 'Tilapia_guineensis'; % ADW
metaData.links.id_Taxo = '5326641'; % Taxonomicon
metaData.links.id_WoRMS = '1021112'; % WoRMS
metaData.links.id_fishbase = 'Coptodon-guineensis'; % Fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coptodon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AyoaBaba2017'; type = 'Article'; bib = [ ... 
'title = {Aspects of the Growth and Reproductive Biology of the {G}uinean Tilapia, \emph{Tilapia guineensis} ({B}leeker, 1862) in a Tropical Freshwater Lake, {N}igeria}, ' ...
'volume = {7}, ' ...
'number = {10}, ' ...
'journal = {Journal of Biology, Agriculture and Healthcare }, ' ...
'author = {Adedolapo A. Ayoade and Babatunde S. Babalola}, ' ...
'year = {2017}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ayoa2015'; type = 'Article'; bib = [ ... 
'title = {Growth, Mortality, and Longevity of \emph{Tilapia guineensis} ({B}leeker, 1852) in Tropical Man-Made Lake, Southwestern {N}igeria}, ' ...
'volume = {7}, ' ...
'number = {2}, ' ...
'journal = {Egypt. Acad. J. Biolog. Sci.}, ' ...
'author = {Adedolapo A. Ayoade}, ' ...
'year = {2015}, ' ...
'pages = {33-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AsasAcol2019'; type = 'Article'; bib = [ ... 
'doi = {10.5455/jfcom.20190401124703}, ' ...
'title = {Potential for the culture of \emph{Tilapia guineensis} ({B}leeker 1862): A comparative growth performance with {N}ile tilapia (\emph{Oreochromis niloticus}) in a fresh water pond}, ' ...
'volume = {1}, ' ...
'journal = {Journal of Frisheries and Coastal Management}, ' ...
'author = {A. Asase and E. S. Acolatse and A. K. Apraku and J. E. Darko}, ' ...
'year = {2019}, ' ...
'pages = {24-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fishbase'; type = 'Misc'; bib = [ ... 
'howpublished = {\url{https://www.fishbase.se/summary/Coptodon-guineensis}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
