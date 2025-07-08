function [data, auxData, metaData, txtData, weights] = mydata_Chaetodon_citrinellus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Chaetodontiformes'; 
metaData.family     = 'Chaetodontidae';
metaData.species    = 'Chaetodon_citrinellus'; 
metaData.species_en = 'Speckled butterflyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 02];

%% set data
% zero-variate data

data.ab = 30/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Zeke2003';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Zeke2003';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 13;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Leis1989';
  comment.Wwb = 'based egg diameter of 0.75 mm: pi/6*0.075^3'; 
data.Wwp = 6.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02344*Lp^2.95, see F1';
data.Wwi = 45.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02344*Li^2.95, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'Zeke2003';   
  temp.GSI = C2K(28.3);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (g)
0.147	3.871
0.206	5.091
0.210	3.341
0.266	5.727
0.297	5.939
0.419	6.629
1.932	9.015
1.933	8.432
1.995	8.644
3.017	8.432
3.046	9.174
3.078	8.750
3.977	8.644
4.006	9.333
4.007	8.962
4.037	9.598
4.996	9.864
5.028	9.598
5.030	8.644
5.955	10.447
6.979	9.598];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Beru2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: weight in g = 0.02344*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 3 - 12 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TBVK'; % Cat of Life
metaData.links.id_ITIS = '169566'; % ITIS
metaData.links.id_EoL = '46578224'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodon_citrinellus'; % Wikipedia
metaData.links.id_ADW = 'Chaetodon_citrinellus'; % ADW
metaData.links.id_Taxo = '170354'; % Taxonomicon
metaData.links.id_WoRMS = '218744'; % WoRMS
metaData.links.id_fishbase = 'Chaetodon-citrinellus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodon_citrinellus}}';
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
bibkey = 'Beru2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-004-2595-0}, ' ...
'author = {Michael L Berumen}, ' ... 
'year = {2005}, ' ...
'title = {The importance of juveniles in modelling growth: butterflyfish at {L}izard {I}sland}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {72(4)}, ' ...
'pages = {409–413}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zeke2003'; type = 'Phdthesis'; bib = [ ... 
'author = {Z. A. Zekeria}, ' ... 
'year = {2003}, ' ...
'title = {Butterflyfishes of the Southern {R}ed {S}ea: Ecology and population dynamics}, ' ...
'school = {Groningen University, the Netherlands}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leis1989'; type = 'Article'; bib = [ ... 
'author = {Leis, J. M.}, ' ... 
'year = {1989}, ' ...
'title = {Larval biology of butterflyfishes ({P}isces, {C}haetodontidae): What do we really know?}, ' ...
'journal = {Envir. Biology of Fishes}, ' ...
'volume = {25}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chaetodon-citrinellus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
