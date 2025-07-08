
function [data, auxData, metaData, txtData, weights] = mydata_Trichogaster_fasciata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Osphronemidae';
metaData.species    = 'Trichogaster_fasciata'; 
metaData.species_en = 'Banded gourami'; 

metaData.ecoCode.climate = {'A','Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 23];

%% set data
% zero-variate data
data.am = 6*365;     units.am = 'd';  label.am = 'life span';  bibkey.am = 'Graa2003';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 5.7;    units.Lp = 'cm'; label.Lp = 'length at puberty for females'; bibkey.Lp = 'Gupt2015';
data.Li = 12.5;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';
  
data.Wwb = 2.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm of Capoeta: pi/6*0.17^3';
data.Wwi = 27.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^2.96, see F1';

data.Ri = 5522/365; units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Gupt2015';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishbase: 600 eggs per bubble-nest';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0	0.157
24.278	0.420
45.981	1.382
64.960	2.169
70.536	3.131
89.497	3.831
100.394	4.531
122.061	5.318
141.077	6.280
165.395	6.892
195.052	7.329
235.423	7.592
275.758	7.679
313.478	8.117
351.217	8.641
380.892	9.166
413.274	9.778
442.967	10.391
480.633	10.566
515.610	10.741
555.945	10.828
596.371	11.353
639.467	11.790
671.867	12.490
712.293	13.015
749.995	13.364
795.742	13.627
836.041	13.539
881.769	13.714
919.417	13.802
957.119	14.152
994.747	14.152];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Graa2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'temperature (C) in tL data is assumed to vary as T(t)=20+10*sin(2*pi(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01549*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58CG4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '217882'; % Ency of Life
metaData.links.id_Wiki = 'Trichogaster_fasciata'; % Wikipedia
metaData.links.id_ADW = 'Colisa_fasciata'; % ADW
metaData.links.id_Taxo = '1683132'; % Taxonomicon
metaData.links.id_WoRMS = '315877'; % WoRMS
metaData.links.id_fishbase = 'Trichogaster-fasciata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trichogaster_fasciata}}';  
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
bibkey = 'Graa2003'; type = 'article'; bib = [ ... 
'doi = {10.1046/j.1365-2400.2003.00341.x}, ' ...
'author = {G. de Graaf}, ' ...
'year = {2003}, ' ...
'title = {The ﬂood pulse and growth of ﬂoodplain ﬁsh in {B}angladesh}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {10}, '...
'pages = {241–247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gupt2015'; type = 'article'; bib = [ ... 
'author = {Sandipan Gupta}, ' ...
'year = {2015}, ' ...
'title = {A note on feeding and reproductive biology of banded gourami, \emph{Trichogaster fasciata} ({B}loch \& {S}chneider, 1801)}, ' ... 
'journal = {International Journal of Research in Fisheries and Aquaculture}, ' ...
'volume = {5(4)}, '...
'pages = {147-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Trichogaster-fasciata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

