  function [data, auxData, metaData, txtData, weights] = mydata_Engraulis_encrasicolus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Engraulis_encrasicolus'; 
metaData.species_en = 'European anchovy';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'T-ah'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Laure Pecquerie'; 'Bas Kooijman'};        
metaData.date_subm = [2013 03 04];                           
metaData.email    = {'laure.pecquerie@ird.fr'};                 
metaData.address  = {'IRD, Brest'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 21];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'GarrSaiz2012'; 
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 60;     units.aj = 'd';    label.aj = 'age at metam';           bibkey.aj = 'Re1996'; 
  temp.aj = C2K(19); units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.ap = .8*365; units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'PecqPeti2009';
  temp.ap = C2K(15);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temperature: average sea surface temperature off West Portuguese coast, Angelico, pers. comm.)';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Pecq2008';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'average life span: 7-8 years, though max. age observed is 13 years old';

data.Lb = 0.3;    units.Lb = 'cm';   label.Lb = 'standard length at birth';  bibkey.Lb = 'CataFolk2010';
  comment.Lb = 'mid-range of smaller size class with gut content (p.309)';
data.Lj = 3.75;   units.Lj = 'cm';   label.Lj = 'standard length at metam';bibkey.Lj = 'Re1996';
data.Lp = 9;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'PecqPeti2009';
data.Li = 18;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Pecq2008';
  comment.Li = 'Average length for Age 3 individuals in spring 2000, Ifremer PELGAS surveys (Pecq2008 p. 63)';

data.Wdb = exp( 0.867 + 0.5 * data.Lb/10) * 1e-6; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';    bibkey.Wdb = 'CataFolk2010';
  comment.Wdb = 'CataFolk2010: ln DW (\mug) = 0.867 + 0.5 SL (mm) - field data';
data.Wdj = 0.0007 * data.Lj^4.2395;  units.Wdj = 'g';    label.Wdj = 'dry weight at metam';    bibkey.Wdj = 'Pecq2008';
  comment.Wdj = 'from Ifremer Juvesu 1999 survey, 3 - 4.4 cm SL fish average';
data.Wwp = 0.0041 * data.Lp ^3.2099; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Pecq2008';
  comment.Wwp = 'From Ifremer PELGAS surveys (PecqPeti2009) - Total length (need checking, includes reprod buffer already)';
data.Wwi = 0.0041 * data.Li ^3.2099; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Pecq2008';
  comment.Wwi = 'From Ifremer PELGAS surveys (PecqPeti2009) - Total length (need checking)';
  
data.Ri = 900;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = {'Pecq2008'};   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ['20 batches of eggs ; between 200 and 500 eggs/g gonad-free wet weight/batch; ', ...
  'GSI  = 0.04 (PethRoos2013); Ri = 20 * 400 * 0.0041 * Li ^3.2099 * 0.96 /365 = 922']; 
  
% uni-variate data
% embryo  
% Regn1996 formula: D = 1788.4199*T^(-2.290236) ; D developement time in
% days till hatching, T temperature (degC)
data.Tah = [ ... % temperature (C), developement time (days) till hatching
15	3.62;
16	3.12;
17	2.72;
18	2.39;
19	2.11;
20	1.87;
21	1.68;
22	1.51;
23	1.36;
24	1.23;
25	1.12;
26	1.03];
units.Tah = {'C', 'd'};  label.Tah = {'temperature', 'age at hatch'};  
bibkey.Tah = {'Regn1996'};

% adult growth at 13 C (on avarage)
% Ifremer PELGAS surveys - cohort 2000 (Pecq2008 p.63)
tLLsd = [ ... % t age in days, L total length (cm), Lsd standard deviation (cm)
1.5*365	12.47	1.54;
2.5*365	15.92	1.05;
3.5*365	17.77	1.48];
data.tL = tLLsd(:,[1 2]); % remove third column
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = {'Pecq2008'};
  temp.tL = C2K(13); units.temp.tL = 'K'; label.temp.tL = 'temperature';
 
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
                                 
%% Links
metaData.links.id_CoL = '39TLP'; % Cat of Life
metaData.links.id_ITIS = '161831'; % ITIS
metaData.links.id_EoL = '46562559'; % Ency of Life
metaData.links.id_Wiki = 'Engraulis_encrasicolus'; % Wikipedia
metaData.links.id_ADW = 'Engraulis_encrasicolus'; % ADW
metaData.links.id_Taxo = '173703'; % Taxonomicon
metaData.links.id_WoRMS = '126426'; % WoRMS
metaData.links.id_fishbase = 'Engraulis-encrasicolus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/European_anchovy}}';  
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
bibkey = 'PecqPeti2009'; type = 'Article'; bib = [ ...  
'author = {Pecquerie, L. and P. Petitgas and S.A.L.M. Kooijman}, ' ...
'year = {2009}, ' ...
'title = {Modeling fish growth and reproduction in the context of the {D}ynamic {E}nergy {B}udget theory to predict environmental impact on anchovy spawning duration}, ' ... 
'journal = {Journal of Sea Research}, ' ...
'volume = 62, '...
'pages = {93--105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Regn1996'; type = 'Article'; bib = [ ...    
'author = {Regner, S.}, ' ...
'year  = {1996}, ' ...
'title = {Effects of environmental changes on early stages and reproduction of anchovy in the {A}driatic {S}ea}, ' ...  
'journal = {Scientia Marina}, ' ...
'volume = {60 (Supl. 2)}, ' ...
'pages = {167--177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GarrSaiz2012'; type = 'Article'; bib = [ ...    
'author = {Garrido, S. and E. Saiz and J. Peters and P. R\''{e} and P. Alvarez and U. Cotano and D. L. Herrero and A. Mart\''{i}nez de Murgu\''{i}a and X. Irigo\`{i}en}, ' ...
'year  = {2012}, ' ...
'title = {Effect of food type and concentration on growth and fatty acid composition of early larvae of the anchovy (\emph{Engraulis encrasicolus}) reared under laboratory conditions.}, ' ...  
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {434-435(0)}, ' ...
'pages = {16--24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CataFolk2010'; type = 'Article'; bib = [ ...    
'author = {Catalan, I. A. and Folkvord, A. and Palomers, I. and Quilez-Badia, G. and Kallianoti, F. and Tselepides, A. and Kallianotis, A.}, ' ...
'year  = {2012}, ' ...
'title = {Growth and feeding patterns of European anchovy (\emph{Engraulis encrasicolus}) early life stages in the {A}egean {S}ea ({N}{E} {M}editerranean)}, ' ...  
'journal = {Estuarine Coastal and Shelf Science}, ' ...
'volume = {86}, ' ...
'pages = {299--312}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Re1996'; type = 'Article'; bib = [ ...    
'author = {R\''{e}, P.}, ' ...
'year  = {1996}, ' ...
'title = {Anchovy spawning in the {M}ira {E}stuary (southwestern {P}ortugal)}, ' ...  
'journal = {Scientia Marina}, ' ...
'volume = {60(Suppl.2)}, ' ...
'pages = {141--153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pecq2008'; type = 'Phdthesis'; bib = [ ...    
'author = {Pecquerie, L.}, ' ...
'year  = {2008}, ' ...
'title = {Bioenergetic modelling of the growth, development and reproduction of a small pelagic fish: the {B}ay of {B}iscay anchovy}, ' ...  
'school = {VU University Amsterdam and Rennes University Agrocampus}, ' ...
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/6CRGTTGH/item-details}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PethRoos2013'; type = 'Article'; bib = [ ...    
'author = {Pethybridge, H. and D. Roos and V. Loizeaua and L. Pecquerie and C. Bacher}, ' ...
'year  = {2013}, ' ...
'title = {Responses of {E}uropean anchovy vital rates and population growth to environmental fluctuations: {A}n individual-based modeling approach}, ' ...  
'journal = {Ecological Modelling}, ' ...
'volume = {250}, ' ...
'pages = {370--383}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
